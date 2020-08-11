package com.enneagram.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.enneagram.dao.TestDAO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class PersonalityControllerTest {

	@Autowired
	private TestDAO testDAO;
	
	@Test
	public void test() {
		String str1 = testDAO.getType(3);
		String str = testDAO.getEclass(3);
		System.out.println(str1);
		System.out.println(str);
	}
}
