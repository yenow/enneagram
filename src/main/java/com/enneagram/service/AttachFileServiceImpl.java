package com.enneagram.service;

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
}
