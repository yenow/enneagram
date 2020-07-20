package com.anneagram.dao;

import com.anneagram.vo.MemberVO;

public interface MemberDAO {

	public void memberInsert(MemberVO m);

	public MemberVO login_confirm(String user_id);

	public void memberUpdate(MemberVO memberVO);
}
