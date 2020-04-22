package com.anneagram.dao;

import java.util.ArrayList;
import java.util.List;

import com.anneagram.vo.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO bo);

	List<BoardVO> selectList();

}
