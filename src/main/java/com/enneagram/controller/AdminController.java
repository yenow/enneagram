package com.enneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enneagram.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
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
