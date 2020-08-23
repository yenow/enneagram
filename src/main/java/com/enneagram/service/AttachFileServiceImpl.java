package com.enneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.AttachFileDAO;
import com.enneagram.domain.AttachFileDTO;

@Service
public class AttachFileServiceImpl implements AttachFileService {

	@Autowired
	private AttachFileDAO attachFileDAO;

	@Override
	public void insertAttachFile(AttachFileDTO a) {
		attachFileDAO.insertAttachFile(a);
		
	}

	@Override
	public List<AttachFileDTO> selectAttachList(int bno) {
		return attachFileDAO.selectAttachList(bno);
	}
}
