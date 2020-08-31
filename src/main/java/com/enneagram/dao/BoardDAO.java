package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.ReplyVO;

public interface BoardDAO {

	void insertBoard(BoardVO bo);

	List<BoardVO> selectList(BoardVO bo, Criteria c);

	BoardVO selectboard(int bno);

	void boardUpdate(BoardVO b);

	void boardDelete(int bno);

	List<BoardVO> boardCount();

	void replyrcnt(ReplyVO re);

	void addCnt(int bno);

	List<BoardVO> selectListSearch(BoardVO bo);

	int boardAllCount(String category);

	int insertBoardReturnBno(BoardVO board);

	void replyRcntDown(int bno);

	void likeyPlus(Integer bno);

	void likeydelete(Integer bno);

	int boardTotalCountByCategory(Criteria c);

	void boardDeleteById(String string);

	int boardTotalCount();

}
