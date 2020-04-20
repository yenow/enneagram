package com.anneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public void boardWrite() {
		
	}
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void boardList() {
		
	}
	
	@RequestMapping("/boardWrite_ok")
	public ModelAndView boardWrite_ok(BoardVO bo) {
		ModelAndView mv = new ModelAndView();
		boardService.insertBoard(bo);
		return mv;
	}
}
