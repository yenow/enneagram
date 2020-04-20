package com.anneagram.dao;

import com.anneagram.vo.MemberVO;

public interface MemberDAO {

	public void insert(MemberVO m);

	public void memberInsert(MemberVO m);

	public MemberVO login_confirm(String user_id);
}
