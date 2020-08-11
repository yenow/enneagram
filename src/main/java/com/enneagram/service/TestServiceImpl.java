package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.TestDAO;
import com.enneagram.vo.PersonalityVO;

@Service
public class TestServiceImpl implements TestSerivce {

	@Autowired
	private TestDAO testDAO;

	@Override
	public void insertPersonality(PersonalityVO p) {
		testDAO.insertPersonality(p);
	}

	@Override
	public String getEclass(int eclass) {
		return testDAO.getEclass(eclass);
	}

	@Override
	public String getType(Integer type) {
		return testDAO.getType(type);
	}
}
