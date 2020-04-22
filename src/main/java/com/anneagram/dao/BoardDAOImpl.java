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
	public List<BoardVO> selectList() {
		return sqlSession.selectList("b_list");
	}
	
	
}
