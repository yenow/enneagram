package com.enneagram.db;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
public class TestDB {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void Test() throws Exception {
		MemberVO m = new MemberVO();
		
		
	}
}
