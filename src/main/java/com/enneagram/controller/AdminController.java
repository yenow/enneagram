package com.enneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enneagram.service.AdminService;
import com.enneagram.vo.MemberVO;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 관리자 로그인
	@RequestMapping("login")
	public void login() {
		
	}
	
	@RequestMapping("login_ok")
	public String login_ok(MemberVO m) {
		return "/admin/dashboard";
	}
	
	//회원 관리 페이지 이동
	@RequestMapping("/memberManage")
	public void memberManage() {
		
	}
	
	//게시글 관리 페이지 이동
	@RequestMapping("/boardManage")
	public void boardManage() {
		
	}
	
	//댓글 관리 페이지 이동
	@RequestMapping("/replyManage")
	public void replyManage() {
		
	}
	
	@RequestMapping("/dashboard")
	public void dashboard() {
		
	}
	
	@RequestMapping("/icons")
	public void icons() {
		
	}
	
	@RequestMapping("/maps")
	public void maps() {
		
	}
	
	@RequestMapping("/notifications")
	public void notifications() {
		
	}
	
	@RequestMapping("/table")
	public void table() {
		
	}
	
	@RequestMapping("/template")
	public void template() {
		
	}
	
	@RequestMapping("/typography")
	public void typography() {
		
	}
	
	@RequestMapping("/upgrade")
	public void upgrade() {
		
	}
	
	@RequestMapping("/user")
	public void user() {
		
	}
}
