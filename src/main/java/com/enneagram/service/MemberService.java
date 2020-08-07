package com.enneagram.service;

import com.enneagram.vo.MemberVO;

public interface MemberService {

	void memberInsert(MemberVO m);

	MemberVO login_confirm(String user_id);

	void memberUpdate(MemberVO memberVO);

}
