package com.anneagram.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anneagram.vo.TestVO;

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
		
		return "home";
	}
	
	@RequestMapping("/index")
	public void index() {
		
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
	
	@RequestMapping("/test/test")
	public void test() {
		
	}
	
	@RequestMapping("/test/test1")
	public String test1(TestVO t, HttpSession session,HttpServletRequest request) {
		
		String ip = getRemoteIP(request);
		
		List<Integer> ar = new ArrayList<Integer>();
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
		t.setAr(ar);
		session.setAttribute("testscore", t);
		return "redirect:/test/test2";
	}
	
	@RequestMapping("/test/test_ok")
	
	@ResponseBody
	public void test2() {
		
	
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
	*/
}
