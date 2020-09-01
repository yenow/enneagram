package com.enneagram.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.ReplyVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	//게시판 입력
	@Override
	public void insertBoard(BoardVO bo) {
		sqlSession.insert("b_insert",bo);
	}

	@Override
	public List<BoardVO> selectList(BoardVO bo,Criteria c) {
		if(c.getSearch()==null || c.getInsertCategory()==null) {
			return sqlSession.selectList("b_list", c);
		}else {
			return sqlSession.selectList("b_list_search", c);
		}
	}

	@Override
	public BoardVO selectboard(int bno) {
		return sqlSession.selectOne("b_board",bno);
	}

	@Override
	public void boardUpdate(BoardVO b) {
		sqlSession.insert("b_update",b);
	}

	@Override
	public void boardDelete(int bno) {
		sqlSession.delete("b_delete",bno);
	}

	@Override
	public List<BoardVO> boardCount() {
		return sqlSession.selectList("b_count");
	}

	@Override
	public void replyrcnt(ReplyVO re) {
		sqlSession.update("b_rcnt", re);
	}

	@Override
	public void addCnt(int bno) {
		sqlSession.update("b_cnt",bno);
	}

	@Override
	public List<BoardVO> selectListSearch(BoardVO bo) {

		return sqlSession.selectList("b_list_search", bo);
		//("b_list_search",bo);
	}
	
	/* 게시글 총 개수*/
	@Override
	public int boardAllCount(String category) {
		return sqlSession.selectOne("boardAllCount",category);
	}

	@Override
	public int insertBoardReturnBno(BoardVO board) {
		return sqlSession.insert("insertBoardReturnBno",board);
	}

	@Override
	public void replyRcntDown(int bno) {
		sqlSession.update("replyRcntDown",bno);
		
	}

	@Override
	public void likeyPlus(Integer bno) {
		sqlSession.update("b_likeyPlus", bno);
	}

	@Override
	public void likeydelete(Integer bno) {
		sqlSession.update("b_likeydelete", bno);
	}

	@Override
	public int boardTotalCountByCategory(Criteria c) {
		return sqlSession.selectOne("b_boardTotalCountByCategory","c");
	}

	@Override
	public void boardDeleteById(String id) {
		sqlSession.delete("b_boardDeleteById",id);
	}

	@Override
	public int boardTotalCount() {
		return sqlSession.selectOne("b_boardTotalCount");
	}

	@Override
	public int boardTotalCountBySearch(Criteria c) {
		return sqlSession.selectOne("b_boardTotalCountBySearch",c);
	}

	@Override
	public List<BoardVO> getBoardByMno(int mno) {
		return sqlSession.selectList("b_getBoardByMno", mno);
	}
	
	
	
}
