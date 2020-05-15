package com.anneagram.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.anneagram.dao.MemberDAO;
import com.anneagram.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
public class TestDB {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void Test() throws Exception {
		MemberVO m = new MemberVO();
		m.setUser_id("tlsdud");
		m.setUser_pw("1234");
		m.setName("신영");
		m.setAddress("주소");
		m.setNickname("신영");
		m.setTel("1111");
		m.setEmail("email");
		
	}
}
