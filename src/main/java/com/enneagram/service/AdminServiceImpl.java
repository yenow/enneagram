package com.enneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.enneagram.dao.AdminDAO;
import com.enneagram.dao.BoardDAO;
import com.enneagram.dao.MemberDAO;
import com.enneagram.dao.ReplyDAO;
import com.enneagram.domain.Criteria;
import com.enneagram.domain.PageDTO;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.ReplyVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private ReplyDAO replyDAO;

	// 회원 관리 페이지 - 멤버 리스트 가져오기
	@Override
	public void memberManage(Criteria c, Model m) {
		System.out.println(c.getInsertCategory());
		log.info("getInsertCategory : "+c.getInsertCategory());
		if(c.getInsertCategory()!=null && c.getInsertCategory()!="") {
			// 검색을 했을경우
			List<MemberVO> mList = adminDAO.getMemberListBySearch(c);
			m.addAttribute("mList", mList);
			int total = memberDAO.getTotalCountBySearch(c);
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
			
		}else {
			//  검색을 안했을경우
			List<MemberVO> mList = adminDAO.getMemberList(c);
			m.addAttribute("mList", mList);
			int total = memberDAO.getTotalCount();
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
		}
	}

	// 게시판 관리 페이지 - 게시판 리스트 가져오기
	@Override
	public void boardManage(Criteria c, Model m) {

		if(c.getInsertCategory()!=null && c.getInsertCategory()!="") {
			List<BoardVO> bList = adminDAO.getBoardListBySearch(c);
			m.addAttribute("bList", bList);
			int total = boardDAO.boardTotalCountBySearch(c);
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
		}else {
			List<BoardVO> bList = adminDAO.getBoardList(c);
			m.addAttribute("bList", bList);
			int total = boardDAO.boardTotalCount();
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
		}
	}

	@Override
	public void replyManage(Criteria c, Model m) {
		if(c.getInsertCategory()!=null && c.getInsertCategory()!="") {
			List<ReplyVO> rList = adminDAO.getReplyListBySearch(c);
			m.addAttribute("rList", rList);
			int total = replyDAO.getTotalCountBySearch(c);
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
		}else {
			List<ReplyVO> rList = adminDAO.getReplyList(c);
			m.addAttribute("rList", rList);
			int total = replyDAO.getTotalCount();
			PageDTO pageDTO = new PageDTO(c, total);
			m.addAttribute("pageDTO", pageDTO);
		}
		
	}
}
