package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 댓글 등록*/
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

	/* 댓글번호로 댓글정보 가져오기 */
	@Override
	public ReplyVO getReply(int rno) {
		return sqlSession.selectOne("getReply", rno);
	}

	@Override
	public void updateReply(ReplyVO re) {
		sqlSession.update("updateReply",re);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("r_getTotalCount");
	}

	@Override
	public int getTotalCountBySearch(Criteria c) {
		return  sqlSession.selectOne("r_getTotalCountBySearch",c);
	}

	@Override
	public List<ReplyVO> getReplyListByMno(int mno) {
		return sqlSession.selectList("r_getReplyListByMno", mno);
	}

	@Override
	public void replyDeleteByMno(int mno) {
		sqlSession.delete("r_replyDeleteByMno", mno);
		
	}

	@Override
	public void replyDeleteByBno(int bno) {
		sqlSession.delete("r_replyDeleteByBno", bno);
	}

}
