package com.enneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.enneagram.dao.AdminDAO;
import com.enneagram.dao.MemberDAO;
import com.enneagram.domain.Criteria;
import com.enneagram.domain.PageDTO;
import com.enneagram.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void memberManage(Criteria c, Model m) {
		List<MemberVO> mList = adminDAO.getMemberList(c);
		m.addAttribute("mList", mList);
		int total = memberDAO.getTotalCount();
		PageDTO pageDTO = new PageDTO(c, total);
		m.addAttribute("pageDTO", pageDTO);
	}
}
