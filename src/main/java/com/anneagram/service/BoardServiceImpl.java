package com.anneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anneagram.dao.BoardDAO;
import com.anneagram.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO bo) {
		boardDAO.insertBoard(bo);
	}
}
