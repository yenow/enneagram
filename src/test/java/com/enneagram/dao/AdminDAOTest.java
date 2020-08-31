package com.enneagram.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.domain.Criteria;
import com.enneagram.testcase.BoardTestCase;
import com.enneagram.testcase.MemberTestCase;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
/* AdminDAO 테스트 클래스 */
@Slf4j
public class AdminDAOTest {

	@Autowired
	AdminDAO adminDAO;
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	BoardDAO boardDAO;
	
	
	@Before
	public void memberTestCase() {
		MemberTestCase mtc = new MemberTestCase(memberDAO);
		BoardTestCase btc = new BoardTestCase(memberDAO,boardDAO);
		mtc.TestCaseInput();
		btc.TestCaseInput();
	}
	
	@Test
	public void getMemberList() {
		Criteria c = new Criteria();
		log.info("totalCount :" +memberDAO.getTotalCount());
		List<MemberVO> mList = adminDAO.getMemberList(c);   // 정확한 페이지를 가져왔다는걸 어떻게 알수있을까?
		log.info("mList :" +mList.get(0).getId());
		assertThat(mList.size(), is(10));
	
	}
	
	@Test
	public void getBoardList() {
		
		
		Criteria c = new Criteria();
		c.setCategory("속닥속닥");
		log.info("totalCount :" +boardDAO.boardTotalCountByCategory(c));
		List<BoardVO> bList = adminDAO.getBoardListByCategory(c);
		
	}
	
	@After
	public void memberTestFinal() {
		MemberTestCase mtc = new MemberTestCase(memberDAO);
		BoardTestCase btc = new BoardTestCase(memberDAO,boardDAO);
		mtc.TestCaseOutput();
	}
	
}
