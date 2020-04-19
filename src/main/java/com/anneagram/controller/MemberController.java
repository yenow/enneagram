package com.anneagram.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anneagram.service.MemberService;
import com.anneagram.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberSerivce;
	
	@RequestMapping("/member_insert")
	public void member_insert() {
		
	}
	
	@RequestMapping("/member_insert_ok")
	public ModelAndView member_insert_ok(MemberVO m) {
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
}
