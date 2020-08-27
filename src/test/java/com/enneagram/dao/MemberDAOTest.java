package com.enneagram.dao;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.enneagram.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
/*
 * @ContextConfiguration({
 * "file:src/main/webapp/WEB-INF/spring/root-context.xml",
 * "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
 */
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
@Slf4j

public class MemberDAOTest {

	@Autowired
	private MemberDAO memberDAO;
	
	private MemberVO memberVO;
	
	@Before
	@Test
	public void setMemberVO() {
		memberVO = new MemberVO(0, "testId", "testPassword", "테스트", "테스트", "test@test.com", "01000000000", "M", "관리자", null, "12-12", null);
		
	}
	
	
	@Test

	public void memberInsertTest() {
		memberDAO.memberInsert(memberVO);;
	}
	
	@Test
	public void login_confirmTest() {
		System.out.println(memberDAO.login_confirm(memberVO.getId()));
	}
	
	@Test
	public void myPersonaltiyListTest() {
		System.out.println(memberDAO.myPersonaltiyList(memberVO.getMno()));
	}
}
