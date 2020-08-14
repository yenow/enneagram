package com.enneagram.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.BoardDAO;
import com.enneagram.vo.BoardVO;
import com.example.domain.Criteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO bo) {
		boardDAO.insertBoard(bo);
	}

	/*
	 * @Override public List<BoardVO> selectList(BoardVO bo) { return
	 * boardDAO.selectList(bo); }
	 */
	
	/* 게시물리스트 ... 페이징처리 해서 가져오기*/
	@Override
	public List<BoardVO> selectList(BoardVO bo, Criteria c) {
		c.setStart(c.getPageNum()*c.getMaxLine()-c.getMaxLine()+1);
		c.setEnd(c.getPageNum()*c.getMaxLine());;
		return boardDAO.selectList(bo,c);
	}

	@Override
	public BoardVO selectboard(int bno,HttpSession session,String sessionId) {
		
		/* 세션을 줘서 조회수 하나만 오르게*/
		if(session.getAttribute("board"+Integer.toString(bno))==null) {
			/* System.out.println("null이였어!"); */
			session.setAttribute("board"+Integer.toString(bno), session.getId());
			session.setMaxInactiveInterval(3600);
			boardDAO.addCnt(bno);    // 조회수 올리는 함수
			return boardDAO.selectboard(bno);
		}else {
			/* 확인용 코드
			System.out.println(bno);
			System.out.println(session.getAttribute("board"+Integer.toString(bno)));*/
			return boardDAO.selectboard(bno);
		}

	}

	@Override
	public void boardUpdate(BoardVO b) {
		boardDAO.boardUpdate(b);
	}

	@Override
	public void boardDelete(int bno) {
		boardDAO.boardDelete(bno);
	}

	@Override
	public List<BoardVO> boardCount() {
		return boardDAO.boardCount();
	}

	@Override
	public List<BoardVO> selectListSearch(BoardVO bo) {
		return boardDAO.selectListSearch(bo);
	}

	/* 게시글 총 개수,, 카테고리별로 */
	@Override
	public int boardAllCount(String category) {
		// TODO Auto-generated method stub
		return boardDAO.boardAllCount(category);
	}


	
}
