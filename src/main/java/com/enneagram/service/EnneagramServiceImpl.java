package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enneagram.dao.EnneagramDAO;
import com.enneagram.vo.EnneagramVO;

@Service
public class EnneagramServiceImpl implements EnneagramService {

	@Autowired
	private EnneagramDAO enneagramDAO;

	
	@Override
	public void insert(EnneagramVO en) {
		if(enneagramDAO.select(en)!=null) {
			enneagramDAO.delete(en);
		}
		enneagramDAO.insert(en);
		
	}

	@Override
	public EnneagramVO select(EnneagramVO en) {
		
		return enneagramDAO.select(en);
	}
}
