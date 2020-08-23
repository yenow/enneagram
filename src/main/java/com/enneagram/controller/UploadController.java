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
		
		String fileRoot = "C:\\summernoteImage\\";	//저장될 외부 파일 경로
		String currentDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		uploadPath = fileRoot + currentDay+"\\";
		File f = new File(uploadPath);
		if(f.exists()==false) {
			f.mkdirs();
		}
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		UUID uuid = UUID.randomUUID();
		String savedFileName = uuid.toString() + extension;	//저장될 파일 명
		
		// + IE일때 오리지날 파일명 처리해주기
		
		// attachFileDTO 생성
		String realName = uuid.toString()+"_"+originalFileName;
		attachFileDTO.setOriginalFileName(originalFileName);
		attachFileDTO.setUuid(savedFileName);
		attachFileDTO.setRealName(realName);
		attachFileDTO.setUploadPath(uploadPath);  // 업로드 경로
		
		
		attachFileDTO.addMappingURL("summernoteImage");
		attachFileDTO.setImage(true);    //  이미지 true
		File targetFile = new File(uploadPath+realName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			map.put("url", "/enneagram/summernoteImage/"+savedFileName);
			map.put("responseCode", "success");
			map.put("attachFileDTO", attachFileDTO);
			r = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			return  r;  // ResponseEntity.ok().body("/summernoteImage/" + savedFileName);
			//jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			//jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			// FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			// jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
			r = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
	        return r;
		}

	}
	
	// 사진업로드
	@PostMapping("myProfileUpload")
	@ResponseBody
	public ResponseEntity<AttachFileDTO> myProfileUpload(@RequestParam("files") MultipartFile multipartFile,HttpServletRequest request) {
		ResponseEntity<AttachFileDTO> re ;
		
		HttpSession session = request.getSession(); 
		if(session.getAttribute("login")==null) {   // 로그인 세션이 없을시
			return new ResponseEntity<AttachFileDTO>(HttpStatus.OK);
		}
		MemberVO m = (MemberVO) session.getAttribute("login");  // 세션으로부터 login 정보를 가져옴
		
		// 예전 파일이 있을 경우 -> 삭제
		AttachFileDTO attachFile = attachFileService.getAttachFile(m.getMno());
		if(attachFile!=null) {
			File beforeAttachFile = new File(attachFile.getUploadPath()+attachFile.getRealName());
			beforeAttachFile.delete();   // 예전 파일 삭제
			attachFileService.deleteMemberAttach(m.getMno());
		}
		
		String currentDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));  //  현재시간을 포맷팅
		System.out.println("날짜 폴더이름 : "+currentDay);
		
		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getContentType());
		
		String uploadPath = "C:\\upload\\profileImage\\"+currentDay+"\\";  // upload될 파일 경로
		File f = new File(uploadPath);
		if(f.exists()==false) {   // 폴더가 존재하지 않을시 생성
			f.mkdirs();
		}
		
		String uuid = UUID.randomUUID().toString();   // uuid 생성
		String originalFileName = multipartFile.getOriginalFilename();  // originalFilename
		String realName = uuid + "_"+ originalFileName;
		AttachFileDTO attachFileDTO =  new AttachFileDTO(originalFileName, uploadPath, uuid, realName);
		attachFileDTO.addMappingURL("upload");
		attachFileDTO.setImage(true);
		attachFileDTO.setMno(m.getMno());
		
		File fullPath = new File(uploadPath + realName);

		try {
			multipartFile.transferTo(fullPath);    // 파일 생성
			attachFileService.insertAttachFileToMember(attachFileDTO);
			re = new ResponseEntity<AttachFileDTO>(attachFileDTO,HttpStatus.OK);
		} catch (IllegalStateException | IOException e) {
			re = new ResponseEntity<AttachFileDTO>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		// 세션으로부터 login 정보를 가져옴
		/*
		if(m.getOriginalName()!=null) {
			File deletePath = new File(m.getUUIDPath());   // 예전 파일 삭제
			if(deletePath.exists()==true) {   // 파일이 존재 할 떄 삭제
				deletePath.delete();
			}
		}*/
		// m.setOriginalName(originalName);
		// m.setUUIDPath(UUIDPath);
		//memberService.updateProfile(m);  //  이미지 경로를 member 테이블에 등록
		
		return re;
	}
	
	// 업로드 사진 삭제, 실제경로, 데이터베이스 모두
	@GetMapping("myProfileDelete")
	@ResponseBody
	public ResponseEntity<String> myProfileDelete(HttpServletRequest request){
		ResponseEntity<String> re;
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("login");
		
		try {
			AttachFileDTO attachFileDTO = attachFileService.getAttachFile(m.getMno());
			attachFileService.deleteMemberAttach(m.getMno());
			// 파일 삭제
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
	
	// 파일업로드
	@PostMapping("fileupload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> fileupload( MultipartHttpServletRequest mrequest){
		ResponseEntity<List<AttachFileDTO>> r ;
		List<MultipartFile> mlist = mrequest.getFiles("file");
		List<AttachFileDTO> alist = new ArrayList<AttachFileDTO>();
		
		String uploadPath = "C:\\upload\\fileUpLoad\\";   // 저장될 외부 파일 경로
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
			attachFileDTO.setImage(false);   // image false -> 이건 자료실 첨부용이기때문
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
	
	// 첨부파일 삭제 ajax
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

	// 다운로드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent,String uploadPath ,String realName) {  // @RequestHeader 를 이용해서 필요한 HTTP 헤더 메세지의 내용을 수집할수 있다
		
		Resource resource = new FileSystemResource(uploadPath + realName);  // 다운로드할 파일 경로와 이름으로 생성
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);  // 여기서 짜르네 ??
		
		HttpHeaders headers = new HttpHeaders(); // HttpHeaders 객체를 이용해서 다운로드시 파일 이름 처리
		try {

			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
			String downloadName = null;

			// IE일 경우
			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");  // 파일이름에 대한 문자열처리는 파일 이름이 한글인 경우 깨지는것을 막기위함	
			}
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);  // 다운로드 시 저장되는 이름을  "Content-Disposition"로 처리

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
