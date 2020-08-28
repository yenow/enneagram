package com.enneagram.dao;

import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.controller.LogExample;
import com.enneagram.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
public class MemberDAOTest {
	private static final Log LOG = LogFactory.getLog( LogExample.class );
	
	@Autowired
	private MemberDAO memberDAO;
	private MemberVO memberVO;
	
	@Before
	@Test
	public void setMemberVO() {
		memberDAO.deleteById("testId");
		memberVO = new MemberVO(0, "testId", "testPassword", "테스트", "테스트", "test@test.com", "01000000000", "M", "관리자", null, "12-12", null);
	}
	
	@Test
	public void memberInsertTest() {   // 멤버 insert가 잘 되는지 확인, insert 후 member 테이블의 개수가 1개 늘어남을 확인?
		
		memberDAO.deleteALL();
		assertSame(memberDAO.getTotalCount(), 0);  // deleteALL 검증
		
		int beforeCount = memberDAO.getTotalCount();
		memberVO = new MemberVO(0, "testId2", "testPassword", "테스트", "테스트", "test@test.com", "01000000000", "M", "관리자", null, "12-12", null);
		memberDAO.memberInsert(memberVO);
		assertSame(memberDAO.getTotalCount(), beforeCount+1);
		
		memberDAO.deleteById("testId2");
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
