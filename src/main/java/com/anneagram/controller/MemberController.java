package com.anneagram.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		memberSerivce.memberInsert(m);
		return mv;
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
	
	@RequestMapping("/login_ok")
	public String login_ok(MemberVO m, HttpSession session, HttpServletResponse response) throws IOException {
		MemberVO member = memberSerivce.login_confirm(m.getUser_id());
		PrintWriter out = response.getWriter();
		
		if(member.getUser_pw() == null) {
			out.print("alert('아이디가없습니다');");
			out.print("history.back()");
		}else {
			if(member.getUser_pw().equals(m.getUser_pw())) {
				out.print("alert('로그인에 성공하셨습니다');");   
				session.setAttribute("login", member);    // login 성공할경우 "login"세션
			}else {
				out.print("alert('비밀번호가 틀립니다');");
				out.print("history.back()");
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
}
