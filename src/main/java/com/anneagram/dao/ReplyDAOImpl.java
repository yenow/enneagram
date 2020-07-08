package com.anneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anneagram.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void replyInsert(ReplyVO re) {
		sqlSession.insert("r_insert", re);
	}

	public void replyInsert_no(ReplyVO re) {
		sqlSession.insert("r_insert_no", re);
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		return sqlSession.selectList("r_list", bno);
	}

	@Override
	public String getPassword(int rno) {
		return sqlSession.selectOne("r_password",rno);
	}

	@Override
	public void replyDelete(int rno) {
		sqlSession.delete("r_delete",rno);
		
	}

	@Override
	public String getUserId(int rno) {
		return sqlSession.selectOne("r_userId",rno);
	}
}
