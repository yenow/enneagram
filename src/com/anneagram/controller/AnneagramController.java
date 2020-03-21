package com.anneagram.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.user")
public class AnneagramController extends HttpServlet{
	
	public AnneagramController() {
	}
	
	@Override
	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doHead(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dorequest(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		dorequest(request, response);
	}
	
	public void dorequest(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		String contextpath = request.getContextPath();
		uri = uri.replace(contextpath, "");
		uri = uri.substring(1,uri.lastIndexOf("."));
		
		switch(uri) {
		case "newuser" : 
		case "login" : 
		}
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doDelete(request, response);
	}
	
	
}
