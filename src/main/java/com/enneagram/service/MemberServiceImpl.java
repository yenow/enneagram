package com.enneagram.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void memberInsert(MemberVO m) {
		memberDAO.memberInsert(m);
	}

	@Override
	public MemberVO login_confirm(String user_id) {
	
		return memberDAO.login_confirm(user_id);
	}

	/* member 수정*/
	@Override
	public void memberUpdate(MemberVO memberVO) {
		memberDAO.memberUpdate(memberVO);
	}

	/* 마이페이지 내 성향 가져오기*/
	@Override
	public PersonalityVO mytype(int mno) {
		return memberDAO.getMytype(mno);
	}

	@Override
	public List<PersonalityVO> myPersonaltiyList(int mno) {
		return memberDAO.myPersonaltiyList(mno);
	}}
