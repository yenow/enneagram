package com.anneagram.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anneagram.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

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
	
	
}
