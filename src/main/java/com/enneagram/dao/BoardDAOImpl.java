package com.enneagram.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<BoardVO> selectList(BoardVO bo) {
		return sqlSession.selectList("b_list", bo);
		
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
	public void replycnt(ReplyVO re) {
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
	
	
	
}