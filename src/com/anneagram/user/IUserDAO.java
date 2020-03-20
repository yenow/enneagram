package com.anneagram.user;

public interface IUserDAO {
	// 회원가입
	void insert(UserVO vo);
	
	// 로그인정보
	UserVO login(String id);
	
	//
}
