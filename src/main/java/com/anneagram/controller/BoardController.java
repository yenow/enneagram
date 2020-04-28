package com.anneagram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.anneagram.service.BoardService;
import com.anneagram.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//게시판 작성
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public void boardWrite() {
		
	}
	
	//게시판 리스트 ,  리스트를 jsp파일로 넘기는게 필요하다. Model을 활용해서 넘긴다.
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)  
	public ModelAndView boardList() {
		ModelAndView mv = new ModelAndView("board/boardList");
		List<BoardVO> blist =boardService.selectList();   // ArrayList는 안되고 List는 되는 이유가 뭘까? 왜 SqlSession의 selectList는 List형만 반환할까?
		mv.addObject("blist",blist);
		return mv;
	}
	
	//게시판 작성을 데이터베이스로 입력
	@RequestMapping("/boardWrite_ok")
	public ModelAndView boardWrite_ok(BoardVO bo) {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");
		boardService.insertBoard(bo);
		return mv;
	}
	
	@GetMapping("/boardCont")
	public ModelAndView boardCont(int bno) {
		ModelAndView mv = new ModelAndView("board/boardCont");
		BoardVO b = boardService.selectboard(bno);
		mv.addObject("b", b);
		return mv;
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public void boardUpdate(Model m ,BoardVO b) {
		m.addAttribute("b", b);
	}
	
	@PostMapping("boardUpdate_ok")
	public ModelAndView boardUpdate_ok(BoardVO b) {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");
		boardService.boardUpdate(b);
		return mv; 
	}
	
}
