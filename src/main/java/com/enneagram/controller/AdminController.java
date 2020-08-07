package com.enneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.enneagram.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
}
