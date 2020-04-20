package com.anneagram.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anneagram.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO m) {
		/*
		 * System.out.println("확인"); sqlSession.insert("m_insert",m);
		 */
	}

	@Override
	public void memberInsert(MemberVO m) {
		sqlSession.insert("m_insert", m);
	}

	@Override
	public MemberVO login_confirm(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m_login", user_id);
	}
}
