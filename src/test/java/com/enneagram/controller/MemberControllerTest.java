package com.enneagram.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.MemberVO;

@WebAppConfiguration  // 이걸붙여주면 되는 이유는??
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MemberControllerTest {
	private static final Logger LOG = LoggerFactory.getLogger(AdminControllerTest.class);
	
	@Autowired public MemberController memberController;
	@Autowired public MemberDAO memberDAO;
	MockMvc mockMvc;

		
	@Before   //모든테스트전에 매번 실행되는 메서드
	public void setUpMockMvc() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();  // mockMvc : 말그대로 가짜 MVC이다
		// 가짜 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller의 getList() 에서 반환돈 결과를 이용해서 Model에 어떤 데이터들이 담겨있느지 확인한다.
	}

	@Test
	public void login_ok() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/member/login_ok").header("Content-type","text/html; charset=utf-8")).andExpect(status().isOk()).andDo(print());
	}
	
	// 회원가입 삽입 테스트
	@Test
	public void member_insert_ok_test() throws Exception {
		MemberVO member = new MemberVO();
		memberDAO.deleteById("id");
		mockMvc.perform(MockMvcRequestBuilders.post("/member/member_insert_ok").header("Content-type","text/html; charset=utf-8").param("id", "id")
				.param("password", "password").param("name", "name").param("nickname", "nickname").param("tel", "tel").param("email", "email").param("gender", "M")
				).andExpect(status().isOk()).andDo(print());
		memberDAO.deleteById("id");
	}
	
	// 회원 수정 테스트
	@Test
	public void member_info_update_ok_test() throws Exception {
		MemberVO member = new MemberVO(0, "id", "password", "name", "nickname", "email11441", "tel", "M", "category", "birth", null, 0);
		memberDAO.deleteById("id");
		memberDAO.memberInsert(member);
		mockMvc.perform(MockMvcRequestBuilders.post("/member/member_info_update_ok").header("Content-type","text/html; charset=utf-8").param("mno",Integer.toString(member.getMno()))
				.param("password", "password").param("name", "name").param("nickname", "nickname").param("tel", "tel").param("email", "email").param("gender", "M")
				).andExpect(status().isOk()).andDo(print());
		memberDAO.deleteById("id");
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