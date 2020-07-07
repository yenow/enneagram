package com.anneagram.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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

	@Override
	public List<BoardVO> selectList(BoardVO bo) {
		return boardDAO.selectList(bo);
	}

	@Override
	public BoardVO selectboard(int bno,HttpSession session,String sessionId) {
		
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
}
