package com.enneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.enneagram.service.BoardService;
import com.enneagram.vo.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	//게시판 작성
	@GetMapping("/boardWrite")
	public void boardWrite() {
		
	}
	
	@PostMapping("/boardWrite_ok")
	public String boardWrite_ok(BoardVO board) {
		
		boardService.insertBoard(board);
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "/boardListButton", method = RequestMethod.GET)  
	public ResponseEntity<T> boardListButton(Criteria c){
		
	}
	
	/* 게시판 리스트 */
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)  
	public String boardList(Model m, Criteria c) {
		BoardVO bo = new BoardVO();
		
		System.out.println("게시물 개수"+c.getMaxLine());
		System.out.println("게시물 개수"+c.getPageNum());
		System.out.println("타입"+c.getType());
		System.out.println("카테고리"+c.getCategory());
		
		/* 카테고리에 따른 게시물 총 개수 가져오기*/
		int maxcount = boardService.boardAllCount(c.getCategory());
		System.out.println(maxcount);
		
		PageDTO pd = new PageDTO(c, maxcount);
		System.out.println("처음 페이지"+pd.getStartPage());
		System.out.println("마지막페이지"+pd.getEndPage());
		System.out.println(pd.isPrev());
		System.out.println(pd.isNext());
		
		
		/* 게시물 리스트 가져오기 */
		List<BoardVO> blist = boardService.selectList(bo,c);
		m.addAttribute("blist", blist);
		
		m.addAttribute("pageDTO", pd);
		m.addAttribute("page", c.getPageNum());
		return "/board/boardList";
	}
	
	//게시판 리스트 ,  리스트를 jsp파일로 넘기는게 필요하다. Model을 활용해서 넘긴다.
	/*
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)  
	public ModelAndView boardList(HttpServletRequest request, @RequestParam(defaultValue = "10", value = "maxLine") String maxLine,
			 @RequestParam(defaultValue = "", value = "search") String search,  @RequestParam(defaultValue = "", value = "search_type") String search_type) {
		ModelAndView mv = new ModelAndView("board/boardList");
		
		// lineMax 설정 
		int lineMax=Integer.parseInt(maxLine);
		int page;
		if(request.getParameter("startnum")==null || Integer.parseInt(request.getParameter("startnum"))<=0) {
			page = 1;
		}else {
			page = Integer.parseInt(request.getParameter("startnum"));
		}
		
		// count 계산 
		List<BoardVO> list = boardService.boardCount(); // 게시판의 개수를 가져오는 함수
		int count=0;
		for(BoardVO a : list) {
			count++;
		}
		count = count/lineMax +1;
		
		if(page>count) {
			page--;
		}
		
		System.out.println(search);
		System.out.println(search_type);
		
		
		//보여줄 시작게시글번호, 마지막 게시글번호
		BoardVO bo = new BoardVO();
		int start = (page-1)*lineMax+1; 
		int end = (page)*lineMax; 
		bo.setStart(start);
		bo.setEnd(end);
		
		List<BoardVO> blist =  new ArrayList<BoardVO>();
		if(search.equals("")) {
			//list 가져오기
			blist =boardService.selectList(bo);   // ArrayList는 안되고 List는 되는 이유가 뭘까? 왜 SqlSession의 selectList는 List형만 반환할까?
		}else {
			bo.setSearch_type(search_type);
			bo.setSearch(search);
			blist = boardService.selectListSearch(bo);
		}
		
		// Date를 String으로 포맷 변환 
		for(BoardVO board : blist) {
		// 여기 오류난다	board.setS_regdate(OracleDateChange.changeDate(board.getRegdate()));  
		}
		mv.addObject("blist",blist);
		mv.addObject("count",count);
		mv.addObject("page",page);
		
		return mv;
	}
	*/
	
	
	//게시판 내용보기
	@GetMapping("/boardCont")
	public ModelAndView boardCont(int bno, HttpSession session) {
		ModelAndView mv = new ModelAndView("/board/boardCont");
		
		/* 댓글 조회수 막기 기능 */
		if(session.getAttribute(Integer.toString(bno))==null) {
			session.setAttribute(Integer.toString(bno), session.getId());
			session.setMaxInactiveInterval(3600);
		}
		BoardVO b = boardService.selectboard(bno,session,session.getId());
		mv.addObject("b", b);
		return mv;
	}
	
	//게시판 수정페이지로 이동
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public void boardUpdate(Model m ,int bno,HttpSession session) {
		BoardVO b = boardService.selectboard(bno,session,session.getId());
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
	
	//게시판 작성
	@RequestMapping(value = "/notice_board", method = RequestMethod.GET)
	public void notice_board() {
			
	}
}
