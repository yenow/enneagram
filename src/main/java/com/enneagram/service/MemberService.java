package com.enneagram.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

public interface MemberService {

	void memberInsert(MemberVO m);

	MemberVO login_confirm(String user_id);

	void memberUpdate(MemberVO memberVO);

	PersonalityVO mytype(int mno);

	List<PersonalityVO> myPersonaltiyList(int mno);


}
