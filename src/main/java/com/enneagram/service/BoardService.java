package com.enneagram.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.enneagram.vo.BoardVO;

public interface BoardService {

	void insertBoard(BoardVO bo);

	List<BoardVO> selectList(BoardVO bo);

	BoardVO selectboard(int bno,HttpSession session,String sessionId);

	void boardUpdate(BoardVO b);

	void boardDelete(int bno);

	List<BoardVO> boardCount();

	List<BoardVO> selectListSearch(BoardVO bo);

}
