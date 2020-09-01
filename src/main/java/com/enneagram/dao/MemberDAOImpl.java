package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.Criteria;
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
	public MemberVO getMemberById(String id) {
		return sqlSession.selectOne("m_login", id);
	}

	@Override
	public void memberUpdate(MemberVO memberVO) {
		sqlSession.update("m_update", memberVO);
	}
	
	// 윤신영 - 아이디가 있는지 확인
	@Override
	public MemberVO isPresent(String id) {
		 return sqlSession.selectOne("isPresent", id);
	}
	
	// 회원번호로 memberVO 객체 가져오기
	@Override
	public MemberVO getMemberVO(int mno) {
		return sqlSession.selectOne("getMemberVO",mno);
	}

	// 모든 멤버 테이블 삭제
	@Override
	public void deleteALL() {
		sqlSession.delete("m_deleteALL");
	}

	// 전체 멤버 개수를 가져옴
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("m_getTotalCount");
	}
	
	// Id 값으로 멤버 레코드 삭제
	@Override
	public void deleteById(String id) {
		sqlSession.delete("m_deleteById", id);
	}

	@Override
	public int getTotalCountBySearch(Criteria c) {
		return sqlSession.selectOne("m_getTotalCountBySearch",c);
	}

	@Override
	public void memberDeleteByMno(int mno) {
		sqlSession.delete("m_memberDeleteByMno", mno);
	}

	@Override
	public MemberVO getMemberByEmail(String email) {
		return sqlSession.selectOne("m_getMemberByEmail", email);
	}
}
