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
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.ReplyVO;

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
		BoardTestCase btc = new BoardTestCase(memberDAO,boardDAO);
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
		c.setSearch(null);
		c.setInsertCategory(null);
		// 카테고리가 잘못들어간다면?? 없다면?
		log.info("totalCount :" +boardDAO.boardTotalCount());
		List<BoardVO> bList = adminDAO.getBoardList(c);
		assertThat(bList.size(), is(10)); // 제대로된 테스트 x ,,,
	}
	
	@Test
	public void getBoardListBySearch() {
		Criteria c = new Criteria();
		BoardTestCase btc = new BoardTestCase(memberDAO, boardDAO);
		btc.TestCaseInput();
		
		c.setSearch("속닥속닥");
		c.setInsertCategory("category");
		List<BoardVO> bList = adminDAO.getBoardListBySearch(c);
		assertThat(bList.size(), is(10));
		
		btc.TestCaseOutput();
	}
	
	@Test
	public void getReplyList() {
		Criteria c = new Criteria();
		List<ReplyVO> rList = adminDAO.getReplyList(c);
		assertThat(rList.size(), is(10)); // 제대로된 테스트 x ,,,
	}
	
	@After
	public void memberTestFinal() {
		BoardTestCase btc = new BoardTestCase(memberDAO,boardDAO);
		btc.TestCaseOutput();

	}
	
}
