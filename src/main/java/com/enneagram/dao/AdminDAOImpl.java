package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.ReplyVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberVO> getMemberList(Criteria c){
		return sqlSession.selectList("a_getMemberList", c);
	}

	@Override
	public List<BoardVO> getBoardListByCategory(Criteria c) {
		return sqlSession.selectList("a_getBoardListByCategory", c);
	}

	@Override
	public List<BoardVO> getBoardList(Criteria c) {
		return sqlSession.selectList("a_getBoardList", c);
	}

	@Override
	public List<ReplyVO> getReplyList(Criteria c) {
		return sqlSession.selectList("a_getReplyList", c);
	}
}
