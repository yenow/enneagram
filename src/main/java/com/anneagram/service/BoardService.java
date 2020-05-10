package com.anneagram.service;

import java.util.ArrayList;
import java.util.List;

import com.anneagram.vo.BoardVO;

public interface BoardService {

	void insertBoard(BoardVO bo);

	List<BoardVO> selectList(BoardVO bo);

	BoardVO selectboard(int bno);

	void boardUpdate(BoardVO b);

	void boardDelete(int bno);

	List<BoardVO> boardCount();

}
