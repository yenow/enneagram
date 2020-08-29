package com.enneagram.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.vo.PersonalityVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
/* TestDAO 테스트 클래스 */
public class TestDAOTest {

	@Autowired
	private TestDAO testDAO;
	
	@Test
	public void asd() {
		PersonalityVO person = new PersonalityVO();
		testDAO.insertPersonality(person);
	}
}
