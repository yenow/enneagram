package com.enneagram.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.enneagram.vo.PersonalityVO;

public interface PersonalitySerivce {

	void insertPersonality(PersonalityVO p);

	String getEclass(int eclass);

	String getType(Integer integer);

	String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse response);

	PersonalityVO mytype(int mno);

	List<PersonalityVO> myPersonaltiyList(int mno);

	PersonalityVO myPersonaltiy(int pno);

	String getMyType(HttpSession session, Model model, HttpServletResponse response);

	String test_complete2(HttpServletRequest request, HttpSession session, HttpServletResponse response);
}
