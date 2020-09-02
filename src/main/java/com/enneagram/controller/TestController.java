package com.enneagram.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enneagram.dao.QueryDAO;
import com.enneagram.domain.QueryNumber;
import com.enneagram.service.PersonalitySerivce;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;
import com.enneagram.vo.QueryVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/test")
@Slf4j
public class TestController {

	@Autowired
	private PersonalitySerivce personalityService;
	@Autowired
	private QueryDAO queryDAO;
	
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
	/*
	@RequestMapping("/test")
	public void test() {
		
	}
	*/
	
	@RequestMapping("/test")
	public void test(Model m,HttpSession Session) {
		
		if(Session.getAttribute("test")!=null) {
			Session.removeAttribute("test");
		}
		List<String> list = new ArrayList<String>();
		Session.setAttribute("test", list);
		
		/*
		QueryNumber qn= new QueryNumber();
		log.info("qn : "+qn);
		List<QueryVO> qList =  queryDAO.selectListQuery(qn);
		m.ad
		*/
	}
	
	@ResponseBody
	@RequestMapping(value = "/submit",method = RequestMethod.POST)
	public ResponseEntity<String> test2_ok(@RequestBody List<String> n,  @RequestParam("pageNum") int pageNum, HttpServletRequest request, HttpSession Session){
		System.out.println(n);
		System.out.println(pageNum);
		
		// 테스트를 하다가 중간에 처음부터 시작할 경우를 대비, test를 리셋
		/*if(pageNum==1) {
			Session.removeAttribute("test");
		}*/
		
		if(Session.getAttribute("test")!=null) {
			System.out.println(Session.getAttribute("test"));
			
			List<String> temp =  (List<String>) Session.getAttribute("test");
			temp.addAll(n);
			Session.setAttribute("test", temp);
			System.out.println(temp);   // 확인용
			
			// 이거 page 로 바꿔야해
			if(pageNum>9) {
				ResponseEntity<String> response = new ResponseEntity<String>("/test/test_complete2", HttpStatus.OK);
				return response;
			}
		}else {
			Session.setAttribute("test", n);
			System.out.println(n);
		}
		
		ResponseEntity<String> response = new ResponseEntity<String>("success", HttpStatus.OK);
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/query", method = RequestMethod.POST)
	public ResponseEntity<List<QueryVO>> query(QueryNumber qn){
		qn.setPageNumEndNum();
		log.info("qn : "+qn);
		try {
			List<QueryVO> qList =  queryDAO.selectListQuery(qn);
			return new ResponseEntity<List<QueryVO>>(qList,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<QueryVO>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	/*
	@ResponseBody
	@RequestMapping("/test_ok")             // @RequestParam 은 get방식을 받는듯하다..
	public ResponseEntity<String> test_ok(@RequestBody List<String> n,  @RequestParam("page") int page, HttpServletRequest request, HttpSession Session) {
		
		System.out.println(n);
		System.out.println(page);
		
		// 테스트를 하다가 중간에 처음부터 시작할 경우를 대비, test를 리셋
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
	*/
	
	// 테스트 완료 페이지
	@RequestMapping("/test_complete")
	public String test_complete2(HttpServletRequest request, HttpSession Session, HttpServletResponse Response) {
		return personalityService.test_complete(request, Session, Response);
	}
	/* 테스트 완료 페이지 */
	/*
	@RequestMapping("/test_complete")
	public String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse Response) {
		return personalityService.test_complete(request, Session, Response);

	}
	*/
}
