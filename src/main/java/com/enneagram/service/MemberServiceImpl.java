package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.MemberVO;

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
	
	
}
