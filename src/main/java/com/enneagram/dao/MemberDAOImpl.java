package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void memberInsert(MemberVO m) {
		sqlSession.insert("m_insert", m);
	}

	@Override
	public MemberVO login_confirm(String user_id) {
		return sqlSession.selectOne("m_login", user_id);
	}

	@Override
	public void memberUpdate(MemberVO memberVO) {
		sqlSession.update("m_update", memberVO);
	}

	@Override
	public PersonalityVO getMytype(int mno) {
		return sqlSession.selectOne("getMytype", mno);
	}

	@Override
	public List<PersonalityVO> myPersonaltiyList(int mno) {
		return sqlSession.selectList("myPersonaltiyList", mno);
	}

	@Override
	public PersonalityVO myPersonaltiy(int pno) {
		return sqlSession.selectOne("myPersonal", pno);
	}
	
	// 윤신영 - 아이디가 있는지 확인
	@Override
	public MemberVO isPresent(String id) {
		 return sqlSession.selectOne("isPresent", id);
	}

	@Override
	public void updateProfile(MemberVO m) {
		sqlSession.update("updateProfile",m);
	}

	@Override
	public void deleteProfile(int mno) {
		sqlSession.update("deleteProfile",mno);
	}
}
