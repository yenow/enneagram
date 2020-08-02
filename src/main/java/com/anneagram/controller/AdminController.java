package com.anneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anneagram.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
}
