package com.enneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.enneagram.dao.AdminDAO;
import com.enneagram.dao.MemberDAO;
import com.enneagram.domain.Criteria;
import com.enneagram.domain.PageDTO;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private MemberDAO memberDAO;

	// 회원 관리 페이지 - 멤버 리스트 가져오기
	@Override
	public void memberManage(Criteria c, Model m) {
		List<MemberVO> mList = adminDAO.getMemberList(c);
		m.addAttribute("mList", mList);
		int total = memberDAO.getTotalCount();
		PageDTO pageDTO = new PageDTO(c, total);
		m.addAttribute("pageDTO", pageDTO);
	}

	// 게시판 관리 페이지 - 게시판 리스트 가져오기
	@Override
	public void boardManage(Criteria c, Model m) {
		List<BoardVO> blist = adminDAO.getBoardListByCategory(c);
	}
}
