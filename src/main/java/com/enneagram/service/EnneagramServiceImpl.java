package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.EnneagramDAO;
import com.enneagram.vo.EnneagramVO;

@Service
public class EnneagramServiceImpl implements EnneagramService {

	@Autowired
	private EnneagramDAO enneagramDAO;

	@Override
	public void insert(EnneagramVO en) {
		enneagramDAO.insert(en);
		
	}

	@Override
	public EnneagramVO select(EnneagramVO en) {
		
		return enneagramDAO.select(en);
	}
}
