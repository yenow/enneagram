package com.anneagram.controller;

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
	
	@ResponseBody
	@RequestMapping("/test/test_ok")             // @RequestParam 은 get방식을 받는듯하다..
	public ResponseEntity<String> test_ok(@RequestBody List<String> n,  @RequestParam("page") int page, HttpServletRequest request, HttpSession Session) {
		String ip = getRemoteIP(request);
		System.out.println(n);
		System.out.println(page);
		
		if(page==1) {
			Session.removeAttribute("test");
		}
		
		if(Session.getAttribute("test")!=null) {
			System.out.println(Session.getAttribute("test"));
			
			List<String> temp =  (List<String>) Session.getAttribute("test");
			temp.addAll(n);
			Session.setAttribute("test", temp);
			System.out.println(temp);   // 확인용
			
			if(temp.size()==81) {
				ResponseEntity<String> response = new ResponseEntity<String>("/test/test_complete", HttpStatus.OK);
				return response;
			}
		}else {
			Session.setAttribute("test", n);
			System.out.println(n);
		}
		
		ResponseEntity<String> response = new ResponseEntity<String>("success", HttpStatus.OK);
		return response;
	}
	
	@RequestMapping("/test/test_complete")
	public String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse Response) {
		String ip = getRemoteIP(request); 
	
		List<String> temp = new ArrayList<String>();
		if(Session.getAttribute("test")!=null) {
			temp = (List<String>) Session.getAttribute("test");
		}else {
			PrintWriter pr;
			try {
				pr = Response.getWriter();
				pr.print("<script> alert('테스트페이지로 이동');  </script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "/test/test_complete";
		}
		
		
		System.out.println(temp);
		/* 각 성향별 값*/
		int[] testNum = new int[9];
		//1번 성향
		testNum[0] = Integer.parseInt(temp.get(2)) + 
				Integer.parseInt(temp.get(20)) +
				Integer.parseInt(temp.get(24)) +
				Integer.parseInt(temp.get(32)) +
				Integer.parseInt(temp.get(34)) +
				Integer.parseInt(temp.get(53)) +
				Integer.parseInt(temp.get(59)) +
				Integer.parseInt(temp.get(64)) +
				Integer.parseInt(temp.get(72));
		//2번성향
		testNum[1] = Integer.parseInt(temp.get(6)) + 
				Integer.parseInt(temp.get(13)) +
				Integer.parseInt(temp.get(18)) +
				Integer.parseInt(temp.get(22)) +
				Integer.parseInt(temp.get(47)) +
				Integer.parseInt(temp.get(51)) +
				Integer.parseInt(temp.get(61)) +
				Integer.parseInt(temp.get(71)) +
				Integer.parseInt(temp.get(76));
		//3번성향
		testNum[2] = Integer.parseInt(temp.get(15)) + 
				Integer.parseInt(temp.get(29)) +
				Integer.parseInt(temp.get(31)) +
				Integer.parseInt(temp.get(38)) +
				Integer.parseInt(temp.get(44)) +
				Integer.parseInt(temp.get(49)) +
				Integer.parseInt(temp.get(65)) +
				Integer.parseInt(temp.get(70)) +
				Integer.parseInt(temp.get(77));
		//4번성향
		testNum[3] = Integer.parseInt(temp.get(4)) + 
				Integer.parseInt(temp.get(12)) +
				Integer.parseInt(temp.get(16)) +
				Integer.parseInt(temp.get(36)) +
				Integer.parseInt(temp.get(40)) +
				Integer.parseInt(temp.get(42)) +
				Integer.parseInt(temp.get(63)) +
				Integer.parseInt(temp.get(73)) +
				Integer.parseInt(temp.get(79));
		//5번성향
		testNum[4] = Integer.parseInt(temp.get(0)) + 
				Integer.parseInt(temp.get(7)) +
				Integer.parseInt(temp.get(10)) +
				Integer.parseInt(temp.get(28)) +
				Integer.parseInt(temp.get(37)) +
				Integer.parseInt(temp.get(45)) +
				Integer.parseInt(temp.get(55)) +
				Integer.parseInt(temp.get(67)) +
				Integer.parseInt(temp.get(74));
		//6번성향
		testNum[5] = Integer.parseInt(temp.get(21)) + 
				Integer.parseInt(temp.get(25)) +
				Integer.parseInt(temp.get(33)) +
				Integer.parseInt(temp.get(39)) +
				Integer.parseInt(temp.get(48)) +
				Integer.parseInt(temp.get(58)) +
				Integer.parseInt(temp.get(68)) +
				Integer.parseInt(temp.get(75)) +
				Integer.parseInt(temp.get(80));
		//7번성향  뭐 잘못적었다..
		testNum[6] = Integer.parseInt(temp.get(5)) + 
				Integer.parseInt(temp.get(14)) +
				Integer.parseInt(temp.get(17)) +
				Integer.parseInt(temp.get(27)) +
				Integer.parseInt(temp.get(30)) +
				Integer.parseInt(temp.get(56)) +
				Integer.parseInt(temp.get(62)) +
				Integer.parseInt(temp.get(66)) +
			    Integer.parseInt(temp.get(78));
		//8번성향
		testNum[7] = Integer.parseInt(temp.get(3)) + 
				Integer.parseInt(temp.get(8)) +
				Integer.parseInt(temp.get(23)) +
				Integer.parseInt(temp.get(35)) +
				Integer.parseInt(temp.get(41)) +
				Integer.parseInt(temp.get(43)) +
				Integer.parseInt(temp.get(46)) +
				Integer.parseInt(temp.get(52)) +
				Integer.parseInt(temp.get(57)) +
				Integer.parseInt(temp.get(80));	
		//9번성향
		testNum[8] = Integer.parseInt(temp.get(1)) + 
				Integer.parseInt(temp.get(9)) +
				Integer.parseInt(temp.get(11)) +
				Integer.parseInt(temp.get(19)) +
				Integer.parseInt(temp.get(26)) +
				Integer.parseInt(temp.get(50)) +
				Integer.parseInt(temp.get(53)) +
				Integer.parseInt(temp.get(60)) +
				Integer.parseInt(temp.get(69));
		
		/*  */
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=1; i<=testNum.length; i++) {
			map.put(i,testNum[i-1]);
		}
		
		Integer[] rank = new Integer[9];
		for(int i=0; i<rank.length ;i++) {
			rank[i] = i+1;
		}
		
		/*  rank에는 순서대로 높은 성향이 들어가있음  */
		Arrays.sort(rank, new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				if(map.get(o1)>map.get(o2)) {
					return -1;
				}else if(map.get(o1)<map.get(o2)) {
					return 1;
				}
				return 0;
			}
			
		} );
		
		for(int a : rank) {
			System.out.print(a+" ");
		}
		System.out.println();
		
		for(int i=1; i<9; i++ ) {
			System.out.print(map.get(i)+" ");
		}
		System.out.println();
		
		Session.setAttribute("first", rank[0]);
		
		return "/test/test_complete";
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
