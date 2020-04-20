package com.anneagram.service;

import com.anneagram.vo.MemberVO;

public interface MemberService {

	void memberInsert(MemberVO m);

	MemberVO login_confirm(String user_id);

}
