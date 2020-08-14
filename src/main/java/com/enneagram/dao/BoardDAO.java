package com.enneagram.dao;

import java.util.ArrayList;
import java.util.List;

import com.enneagram.vo.BoardVO;
import com.enneagram.vo.ReplyVO;
import com.example.domain.Criteria;

public interface BoardDAO {

	void insertBoard(BoardVO bo);

	List<BoardVO> selectList(BoardVO bo, Criteria c);

	BoardVO selectboard(int bno);

	void boardUpdate(BoardVO b);

	void boardDelete(int bno);

	List<BoardVO> boardCount();

	void replycnt(ReplyVO re);

	void addCnt(int bno);

	List<BoardVO> selectListSearch(BoardVO bo);

	int boardAllCount(String category);

}
