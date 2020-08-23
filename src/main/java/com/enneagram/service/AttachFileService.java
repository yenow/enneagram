package com.enneagram.service;

import java.util.List;

import com.enneagram.domain.AttachFileDTO;

public interface AttachFileService {

	void insertAttachFile(AttachFileDTO a);

	List<AttachFileDTO> selectAttachList(int bno);
	
	AttachFileDTO getAttachFile(int mno);

	void insertAttachFileToMember(AttachFileDTO attachFileDTO);

	void deleteMemberAttach(int mno);

}
