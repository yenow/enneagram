package com.enneagram.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

public interface MemberService {

	void memberInsert(MemberVO m);

	MemberVO getMemberById(String id);

	void memberUpdate(MemberVO memberVO);

	void naverlogin(String state, String code, HttpServletRequest request, HttpServletResponse response, Model m) throws UnsupportedEncodingException;

	Boolean idValidate(String id);

	MemberVO getMemberVO(int mno);

	void memberDeleteByMno(int mno);


}
