package com.enneagram.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
/* TestDAO 테스트 클래스 */
public class PersonalityDAOTest {

	@Autowired
	private PersonalityDAO personalityDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	PersonalityVO person;
	
	@Before
	public void setPersonalityVO() {
		memberDAO.deleteById("testId");
		MemberVO memberVO = new MemberVO(0, "testId", "testPassword", "테스트", "테스트", "test@test.com", "01000000000", "M", "관리자", "12-12", null,0);
		memberDAO.memberInsert(memberVO);  
		memberVO = memberDAO.getMemberById(memberVO.getId());
		
		person = new PersonalityVO(0,memberVO.getMno(),null,2,5,1,1,1,1,1,1,1,1,1);
		//(int pno, int mno, LocalDateTime regdate, int eclass, int type, int one, int two, int three, int four, int five, int six, int seven, int eight, int nine)
	}
	
	// insertPersonality() 테스트 코드
	@Test
	public void insertPersonalityTest() {
		int beforeTotalCount = personalityDAO.getTotalCount();
		personalityDAO.insertPersonality(person);
		int afterTotalCount = personalityDAO.getTotalCount();
		assertThat(beforeTotalCount, is(afterTotalCount-1)); 
	}
}
