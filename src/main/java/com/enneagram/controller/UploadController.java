package com.enneagram.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.enneagram.domain.AttachFileDTO;
import com.enneagram.service.AttachFileService;
import com.enneagram.service.MemberService;
import com.enneagram.vo.MemberVO;

@Controller
public class UploadController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AttachFileService attachFileService;
	
	// summernote
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		Map<String, Object> map =  new HashMap<String, Object>();
		ResponseEntity<Map<String, Object>> r ;
		AttachFileDTO attachFileDTO = new AttachFileDTO();
		String uploadPath;
		
		String fileRoot = "C:\\summernoteImage\\";	//????????? ?????? ?????? ??????
		String currentDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		uploadPath = fileRoot + currentDay+"\\";
		File f = new File(uploadPath);
		if(f.exists()==false) {
			f.mkdirs();
		}
		
		String originalFileName = multipartFile.getOriginalFilename();	//???????????? ?????????
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//?????? ?????????
		UUID uuid = UUID.randomUUID();
		String savedFileName = uuid.toString() + extension;	//????????? ?????? ???
		
		// + IE?????? ???????????? ????????? ???????????????
		
		// attachFileDTO ??????
		String realName = uuid.toString()+"_"+originalFileName;
		attachFileDTO.setOriginalFileName(originalFileName);
		attachFileDTO.setUuid(savedFileName);
		attachFileDTO.setRealName(realName);
		attachFileDTO.setUploadPath(uploadPath);  // ????????? ??????
		
		
		attachFileDTO.addMappingURL("summernoteImage");
		attachFileDTO.setImage(true);    //  ????????? true
		File targetFile = new File(uploadPath+realName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//?????? ??????
			map.put("url", "/enneagram/summernoteImage/"+savedFileName);
			map.put("responseCode", "success");
			map.put("attachFileDTO", attachFileDTO);
			r = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			return  r;  // ResponseEntity.ok().body("/summernoteImage/" + savedFileName);
			//jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			//jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			// FileUtils.deleteQuietly(targetFile);	//????????? ?????? ??????
			// jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
			r = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
	        return r;
		}

	}
	
	// ???????????????
	@PostMapping("myProfileUpload")
	@ResponseBody
	public ResponseEntity<AttachFileDTO> myProfileUpload(@RequestParam("files") MultipartFile multipartFile,HttpServletRequest request) {
		ResponseEntity<AttachFileDTO> re ;
		
		HttpSession session = request.getSession(); 
		if(session.getAttribute("login")==null) {   // ????????? ????????? ?????????
			return new ResponseEntity<AttachFileDTO>(HttpStatus.OK);
		}
		MemberVO m = (MemberVO) session.getAttribute("login");  // ?????????????????? login ????????? ?????????
		
		// ?????? ????????? ?????? ?????? -> ??????
		AttachFileDTO attachFile = attachFileService.getAttachFile(m.getMno());
		if(attachFile!=null) {
			File beforeAttachFile = new File(attachFile.getUploadPath()+attachFile.getRealName());
			beforeAttachFile.delete();   // ?????? ?????? ??????
			attachFileService.deleteMemberAttach(m.getMno());
		}
		
		String currentDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));  //  ??????????????? ?????????
		System.out.println("?????? ???????????? : "+currentDay);
		
		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getContentType());
		
		String uploadPath = "C:\\upload\\profileImage\\"+currentDay+"\\";  // upload??? ?????? ??????
		File f = new File(uploadPath);
		if(f.exists()==false) {   // ????????? ???????????? ????????? ??????
			f.mkdirs();
		}
		
		String uuid = UUID.randomUUID().toString();   // uuid ??????
		String originalFileName = multipartFile.getOriginalFilename();  // originalFilename
		String realName = uuid + "_"+ originalFileName;
		AttachFileDTO attachFileDTO =  new AttachFileDTO(originalFileName, uploadPath, uuid, realName);
		attachFileDTO.addMappingURL("upload");
		attachFileDTO.setImage(true);
		attachFileDTO.setMno(m.getMno());
		
		File fullPath = new File(uploadPath + realName);

		try {
			multipartFile.transferTo(fullPath);    // ?????? ??????
			attachFileService.insertAttachFileToMember(attachFileDTO);
			re = new ResponseEntity<AttachFileDTO>(attachFileDTO,HttpStatus.OK);
		} catch (IllegalStateException | IOException e) {
			re = new ResponseEntity<AttachFileDTO>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		// ?????????????????? login ????????? ?????????
		/*
		if(m.getOriginalName()!=null) {
			File deletePath = new File(m.getUUIDPath());   // ?????? ?????? ??????
			if(deletePath.exists()==true) {   // ????????? ?????? ??? ??? ??????
				deletePath.delete();
			}
		}*/
		// m.setOriginalName(originalName);
		// m.setUUIDPath(UUIDPath);
		//memberService.updateProfile(m);  //  ????????? ????????? member ???????????? ??????
		
		return re;
	}
	
	// ????????? ?????? ??????, ????????????, ?????????????????? ??????
	@GetMapping("myProfileDelete")
	@ResponseBody
	public ResponseEntity<String> myProfileDelete(HttpServletRequest request){
		ResponseEntity<String> re;
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("login");
		
		try {
			AttachFileDTO attachFileDTO = attachFileService.getAttachFile(m.getMno());
			attachFileService.deleteMemberAttach(m.getMno());
			// ?????? ??????
			File fullPath = new File(attachFileDTO.getUploadPath()+attachFileDTO.getRealName());
			if(fullPath.exists()) {
				fullPath.delete();
			}  
			re = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			re = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return  re;
	}
	
	// ???????????????
	@PostMapping("fileupload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> fileupload( MultipartHttpServletRequest mrequest){
		ResponseEntity<List<AttachFileDTO>> r ;
		List<MultipartFile> mlist = mrequest.getFiles("file");
		List<AttachFileDTO> alist = new ArrayList<AttachFileDTO>();
		
		String uploadPath = "C:\\upload\\fileUpLoad\\";   // ????????? ?????? ?????? ??????
		String currentDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		uploadPath = uploadPath + currentDay + "\\";
		File uploadPathFile = new File(uploadPath);
		if(uploadPathFile.exists()==false) {
			uploadPathFile.mkdirs();
		}
		
		for(MultipartFile m : mlist ) {
			String originalFileName = m.getOriginalFilename();
			UUID uuidname = UUID.randomUUID();
			String uuid = uuidname.toString();
			String realName = uuid+"_"+originalFileName;
			
			AttachFileDTO attachFileDTO = new AttachFileDTO(originalFileName,uploadPath,uuid,realName);
			attachFileDTO.addMappingURL("upload");
			attachFileDTO.setImage(false);   // image false -> ?????? ????????? ?????????????????????
			File f = new File(uploadPath+realName);
			try {
				m.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				return new ResponseEntity<List<AttachFileDTO>>(HttpStatus.BAD_REQUEST);
			}
			alist.add(attachFileDTO);
		}
		r = new ResponseEntity<List<AttachFileDTO>>(alist,HttpStatus.OK);
		return r;
	}
	
	// ???????????? ?????? ajax
	@GetMapping("fileDelete")
	@ResponseBody
	public String fileDelete(@RequestParam("uploadPath") String uploadPath, String realName) {
		
		try {
			File f = new File(uploadPath+realName);
			if(f.exists()) {
				f.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}

	// ????????????
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent,String uploadPath ,String realName) {  // @RequestHeader ??? ???????????? ????????? HTTP ?????? ???????????? ????????? ???????????? ??????
		
		Resource resource = new FileSystemResource(uploadPath + realName);  // ??????????????? ?????? ????????? ???????????? ??????
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);  // ????????? ????????? ??
		
		HttpHeaders headers = new HttpHeaders(); // HttpHeaders ????????? ???????????? ??????????????? ?????? ?????? ??????
		try {

			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
			String downloadName = null;

			// IE??? ??????
			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");  // ??????????????? ?????? ?????????????????? ?????? ????????? ????????? ?????? ??????????????? ????????????	
			}
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);  // ???????????? ??? ???????????? ?????????  "Content-Disposition"??? ??????

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
