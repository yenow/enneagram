package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.AttachFileDTO;

public interface AttachFileDAO {

	void insertAttachFile(AttachFileDTO a);

	List<AttachFileDTO> selectAttachList(int bno);

	AttachFileDTO getAttachFile(int mno);

	void insertAttachFileToMember(AttachFileDTO attachFileDTO);

	void deleteMemberAttach(int mno);

}
