package com.enneagram.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enneagram.vo.PersonalityVO;

public interface PersonalitySerivce {

	void insertPersonality(PersonalityVO p);

	String getEclass(int eclass);

	String getType(Integer integer);

	String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse response);

}
