package com.enneagram.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.testcase.BoardTestCase;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
/* AdminDAO 테스트 클래스 */
@Slf4j
public class BoardDAOTest {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void TestCate() {
		BoardTestCase btc = new BoardTestCase(memberDAO,boardDAO); 
		btc.TestCaseInput();
		btc.TestCaseOutput();
	}
	
}
