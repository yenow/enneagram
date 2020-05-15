package com.anneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anneagram.dao.MemberDAO;
import com.anneagram.vo.MemberVO;

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
	
	
}
