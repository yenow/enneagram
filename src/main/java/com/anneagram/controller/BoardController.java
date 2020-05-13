package com.anneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	public ModelAndView boardList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board/boardList");
		int lineMax=10;
		int page;
		if(request.getParameter("startnum")==null) {
			page = 1;
		}else {
			page = Integer.parseInt(request.getParameter("startnum"));
		}
		
		System.out.println(page);
		
		//보여줄 시작게시글번호, 마지막 게시글번호
		BoardVO bo = new BoardVO();
		int start = (page-1)*lineMax+1; 
		int end = (page)*lineMax; 
		bo.setStart(start);
		bo.setEnd(end);
		
		// count 계산
		List<BoardVO> list = boardService.boardCount();
		int count=0;
		for(BoardVO a : list) {
			count++;
		}
		count = count/lineMax +1;
		
		System.out.println(count);
		System.out.println(start);
		System.out.println(end);
		
		//list 가져오기
		List<BoardVO> blist =boardService.selectList(bo);   // ArrayList는 안되고 List는 되는 이유가 뭘까? 왜 SqlSession의 selectList는 List형만 반환할까?
		mv.addObject("blist",blist);
		mv.addObject("count",count);
		mv.addObject("page",page);
		
		return mv;
	}
	
	//게시판 작성을 데이터베이스로 입력
	@RequestMapping("/boardWrite_ok")
	public ModelAndView boardWrite_ok(BoardVO bo) {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");
		boardService.insertBoard(bo);
		return mv;
	}
	
	//게시판 내용보기
	@GetMapping("/boardCont")
	public ModelAndView boardCont(int bno) {
		ModelAndView mv = new ModelAndView("board/boardCont");
		
		BoardVO b = boardService.selectboard(bno);
		mv.addObject("b", b);
		
		
		return mv;
	}
	
	//게시판 수정페이지로 이동
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public void boardUpdate(Model m ,BoardVO b) {
		m.addAttribute("b", b);
	}
	
	//게시판 수정
	@PostMapping("/boardUpdate_ok")
	public ModelAndView boardUpdate_ok(BoardVO b) {
		ModelAndView mv = new ModelAndView("redirect:/board/boardCont?bno="+b.getBno());
		boardService.boardUpdate(b);
		return mv; 
	}
	
	//게시판 삭제
	@GetMapping("/boardDelete")
	public ModelAndView boardDelete(int bno, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");
		boardService.boardDelete(bno);
		PrintWriter out = response.getWriter();
		
		out.println("alert('게시글이 삭제되었습니다');");
		return mv; 
	} 
	
}
