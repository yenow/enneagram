package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.EnneagramDAO;

@Service
public class EnneagramServiceImpl implements EnneagramService {

	@Autowired
	private EnneagramDAO enneagramDAO;
}
