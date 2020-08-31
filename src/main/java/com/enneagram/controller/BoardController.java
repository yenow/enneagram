package com.enneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.enneagram.domain.AttachFileDTO;
import com.enneagram.domain.Criteria;
import com.enneagram.domain.PageDTO;
import com.enneagram.service.AttachFileService;
import com.enneagram.service.BoardService;
import com.enneagram.service.LikeyService;
import com.enneagram.service.MemberService;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.LikeyVO;
import com.enneagram.vo.MemberVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AttachFileService attachFileService;
	@Autowired
	private LikeyService likeyService;
	
	
	// 좋아요 취소 ajax
	@GetMapping("likeydelete")
	@ResponseBody
	public String likeydelete(Integer bno, int mno) {
		System.out.println("likeydelete");
		
		LikeyVO likey = likeyService.getLikey(bno,mno);
		if(likey!=null) {    // likey가 있으면 삭제
			likeyService.likeydelete(bno,mno);
		}
		
		return "success";
	}
	
	// 좋아요 추가 ajax
	@GetMapping("likeyPlus")
	@ResponseBody
	public String likeyPlus(Integer bno, int mno) {
		System.out.println("likeyPlus");
		
		LikeyVO likey = likeyService.getLikey(bno,mno);
		if(likey==null) {    // likey가 없을때 추가
			likeyService.likeyPlus(bno,mno);
		}
		
		return "success";
	}
	
	// Attach 받기
	@PostMapping("boardAttachFileDTO")
	@ResponseBody
	//@RequestBody AttachFileDTO[] attachFileDTO, Integer bno
	public ResponseEntity<String> boardAttachFileDTO(@RequestBody AttachFileDTO[] AttachFileDTOArray){
		
	
		ResponseEntity<String> r;
		 try {
			 for(AttachFileDTO a : AttachFileDTOArray) {
				 System.out.println("   "+a.getMappingURL());
				 System.out.println("   "+a.getBno());
				 System.out.println("   "+a.getMno());
				 
				 attachFileService.insertAttachFile(a);
			 }
			
			 r = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			r = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		 return r;
	}
	
	// board 내용 받기
	@PostMapping("/boardWriteAjax")
	@ResponseBody
	public ResponseEntity<String> boardWriteAjax(BoardVO board) {
		ResponseEntity<String> r;
		System.out.println("카테고리/ "+board.getCategory());
		System.out.println("내용/ "+board.getContent());
		
		try {
			int bno = boardService.insertBoardReturnBno(board);
			r = new ResponseEntity<String>(Integer.toString(board.getBno()),HttpStatus.OK);
		} catch (Exception e) {
			r = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return r;
	}
	
	//게시판 작성
	@GetMapping("/boardWrite")
	public void boardWrite(BoardVO board, Model m) {
		m.addAttribute("category", board.getCategory());
	}
	
	@PostMapping("/boardWrite_ok")
	public String boardWrite_ok(BoardVO board, Model m) {
		m.addAttribute("category", board.getCategory());
		boardService.insertBoard(board);
		return "redirect:/board/boardList";
	}
	
	/* 게시판 리스트 */
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)  
	public String boardList(Model m, Criteria c) {
		BoardVO bo = new BoardVO();
		
		/*
		 * System.out.println("게시물 개수"+c.getMaxLine());
		 * System.out.println("게시물 개수"+c.getPageNum());
		 * System.out.println("타입"+c.getType());
		 * System.out.println("카테고리"+c.getCategory());
		 * System.out.println("검색 타입"+c.getInsertCategory());
		 * System.out.println("검색"+c.getSearch());
		 */
		
		/* 카테고리에 따른 게시물 총 개수 가져오기*/
		int maxcount = boardService.boardAllCount(c.getCategory());
		System.out.println(maxcount);
		
		PageDTO pd = new PageDTO(c, maxcount);
		/*
		 * System.out.println("처음 페이지"+pd.getStartPage());
		 * System.out.println("마지막페이지"+pd.getEndPage());
		 */
		
		
		/* 게시물 리스트 가져오기 */
		List<BoardVO> blist = boardService.selectList(bo,c);
		m.addAttribute("blist", blist);
		
		m.addAttribute("pageDTO", pd);
		m.addAttribute("page", c.getPageNum());
		return "/board/boardList";
	}
		
	
	//게시판 내용보기
	@GetMapping("/boardCont")
	public ModelAndView boardCont(int bno, HttpSession session, Criteria c) {
		ModelAndView mv = new ModelAndView("/board/boardCont");
		
		/* 댓글 조회수 막기 기능 */
		if(session.getAttribute(Integer.toString(bno))==null) {
			session.setAttribute(Integer.toString(bno), session.getId());
			session.setMaxInactiveInterval(3600);
		}
		BoardVO b = boardService.selectboard(bno,session,session.getId());
		List<AttachFileDTO> attachList =  attachFileService.selectAttachList(bno);  // 게시판 첨부파일 리스트 가져오기, 
		AttachFileDTO attachFileMember = attachFileService.getAttachFile(b.getMno());  //  회원의 프로필 사진 가져오기
		mv.addObject("b", b);
		// 게시판 글쓴이 정보가져오기
		MemberVO m = memberService.getMemberById(b.getId());
		mv.addObject("boardMember", m);
		
		int maxcount = boardService.boardAllCount(c.getCategory());   // 게시글 총 개수
		PageDTO pd = new PageDTO(c, maxcount);
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		// 로그인이 되어있을 때
		if(member!=null) {
			int mno = member.getMno();
			LikeyVO likey = likeyService.getLikey(bno, mno);
			mv.addObject("likey", likey);
		}
		
		mv.addObject("pageDTO", pd);
		mv.addObject("attachList",attachList);
		mv.addObject("attachFileMember",attachFileMember);
		
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
		out.close();
		return mv; 
	} 
	
	//게시판 작성
	@RequestMapping(value = "/notice_board", method = RequestMethod.GET)
	public void notice_board() {
			
	}
}
