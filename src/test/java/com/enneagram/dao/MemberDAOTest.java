package com.enneagram.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.enneagram.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class MemberDAOTest {

	@Autowired
	private MemberDAO memberDAO;
	private MemberVO memberVO;
	
	@Test
	public void setMemberVO() {
		
		
	}
	
	@Test
	@Rollback
	public void memberInsertTest() {
		
	}
	
}
