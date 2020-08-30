package com.enneagram.controller;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.enneagram.vo.MemberVO;

@WebAppConfiguration  // 이걸붙여주면 되는 이유는??
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MemberControllerTest {
	private static final Logger LOG = LoggerFactory.getLogger(AdminControllerTest.class);
	
	@Autowired
	public MemberController memberController;
	MockMvc mockMvc;

		
	@Before   //모든테스트전에 매번 실행되는 메서드
	public void setUpMockMvc() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();  // mockMvc : 말그대로 가짜 MVC이다
		// 가짜 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller의 getList() 에서 반환돈 결과를 이용해서 Model에 어떤 데이터들이 담겨있느지 확인한다.
	}

	
	
	
	@Test
	public void testListAutowired() {
		System.out.println("확인");
	}
	
}

//@Autowired
	//public MemberController memberController;
	//MockMvc mockMvc;

	/*
	@Before   // 모든테스트전에 매번 실행되는 메서드
	public void setUpMockMvc() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();  // mockMvc : 말그대로 가짜 MVC이다
		// 가짜 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller의 getList() 에서 반환돈 결과를 이용해서 Model에 어떤 데이터들이 담겨있느지 확인한다.
	}*/

	/*
	 * @Test public void testList(HttpServletRequest request) throws Exception {
	 * 
	 * MemberVO m = new MemberVO(); m.setMno(2);
	 * request.getSession().setAttribute("login", m); //System.out.println(
	 * //mockMvc.perform(MockMvcRequestBuilders.get("/member/mytype")).andReturn().
	 * getModelAndView().getModelMap()); }
	 */