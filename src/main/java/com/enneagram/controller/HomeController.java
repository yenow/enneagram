package com.enneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/* 사용자의 ip주소를 가져오는 메서드 */
	public String getRemoteIP(HttpServletRequest request){
		String ip = request.getHeader("X-FORWARDED-FOR"); 

		//proxy 환경일 경우
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		//웹로직 서버일 경우
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr() ;
		}

		return ip;
	}
	// getRemoteIP() 끝

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping("/ajaxtest")
	public void ajaxtest() {
		
	}
	
	
	@RequestMapping("/info/header")
	public void header() {
		
	}
	
	@RequestMapping("/anneagram/anneagram")
	public void anneagram() {
		
	}
	
	@RequestMapping("/anneagram/nine_type")
	public void nine_type() {
		
	}
	
	@RequestMapping("/anneagram/history")
	public void history() {
		
	}

	
	
	
	@RequestMapping("/anneagram/1_type")
	public String type1() {
		return "/anneagram/1_type";
	}
	
	@RequestMapping("/anneagram/2_type")
	public String type2() {
		return "/anneagram/2_type";
	}
	@RequestMapping("/anneagram/3_type")
	public String type3() {
		return "/anneagram/3_type";
	}
	
	@RequestMapping("/anneagram/4_type")
	public String type4() {
		return "/anneagram/4_type";
	}
	@RequestMapping("/anneagram/5_type")
	public String type5() {
		return "/anneagram/5_type";
	}
	
	@RequestMapping("/anneagram/6_type")
	public String type6() {
		return "/anneagram/6_type";
	}
	@RequestMapping("/anneagram/7_type")
	public String type7() {
		return "/anneagram/7_type";
	}
	
	@RequestMapping("/anneagram/8_type")
	public String type8() {
		return "/anneagram/8_type";
	}
	
	@RequestMapping("/anneagram/9_type")
	public String type9() {
		return "/anneagram/9_type";
	}
	
	
	
	/*
	@RequestMapping("/test/test2")
	public String test2(TestVO t, HttpSession session) {
		TestVO t2 = (TestVO) session.getAttribute("testscore");
		List<Integer> ar = t2.getAr();
		ar.add(Integer.parseInt(t.getNumber1()));
		ar.add(Integer.parseInt(t.getNumber2()));
		ar.add(Integer.parseInt(t.getNumber3()));
		ar.add(Integer.parseInt(t.getNumber4()));
		ar.add(Integer.parseInt(t.getNumber5()));
		ar.add(Integer.parseInt(t.getNumber6()));
		ar.add(Integer.parseInt(t.getNumber7()));
		ar.add(Integer.parseInt(t.getNumber8()));
		ar.add(Integer.parseInt(t.getNumber9()));
		ar.add(Integer.parseInt(t.getNumber10()));
		
		System.out.println(ar);
		session.setAttribute("testscore", ar);
		return "redirect:/test/test";
	}
	"<!doctype html><html lang="ko"><head><title>HTTP 상태 400 – 잘못된 요청</title><style type="text/css">body {font-family:Tahoma,Arial,sans-serif;} h1, h2, h3, b {color:white;background-color:#525D76;} h1 {font-size:22px;} h2 {font-size:16px;} h3 {font-size:14px;} p {font-size:12px;} a {color:black;} .line {height:1px;background-color:#525D76;border:none;}</style></head><body><h1>HTTP 상태 400 – 잘못된 요청</h1><hr class="line" /><p><b>타입</b> 상태 보고</p><p><b>메시지</b> Required List parameter &#39;value[]&#39; is not present</p><p><b>설명</b> 클라이언트 오류로서 인지된 어떤 문제로 인하여, 서버가 해당 요청을 처리할 수 없거나, 처리하지 않을 것입니다. (예: 잘못된 요청 문법, 유효하지 않은 요청 메시지 framing, 또는 신뢰할 수 없는 요청 라우팅).</p><hr class="line" /><h3>Apache Tomcat/9.0.35</h3></body></html>"
	*/
}
