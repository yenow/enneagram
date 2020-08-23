package com.enneagram.domain;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/* 첨부파일의 정보를 저장하는 AttachFileDTO */

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class AttachFileDTO {

	private String originalFileName;   // 원본파일이름
	private String uploadPath;   //  업로드 경로
	private String uuid;   // uuid
	private String mappingURL;
	private String realName;
	private boolean image;    //   이미지 여부
	private int bno;
	private int mno;
	private int atno;

	public AttachFileDTO() {
		
	}
	
	public AttachFileDTO(String originalFileName, String uploadPath, String uuid, String realName) {
		super();
		this.originalFileName = originalFileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.realName = realName;
	}
	
	public void addMappingURL(String standardString) {
		if(this.uploadPath!=null) {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			String contextPath = attr.getRequest().getContextPath(); 
			
			String temp = this.uploadPath;
			temp = temp.substring(temp.indexOf(standardString)-1).replace("\\", "/");
			this.mappingURL = contextPath+temp;
		}
	}



	
}
