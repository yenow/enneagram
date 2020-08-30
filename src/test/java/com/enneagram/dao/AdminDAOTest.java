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
	
	@Before
	public void memberTestCase() {
		int before = memberDAO.getTotalCount();  // 이게 되려면 그전에 데이터가 없어야함..
		for(int i=0; i<100; i++) {
			if(memberDAO.login_confirm("adminTest"+i)!=null) {
				memberDAO.deleteById("adminTest"+i);
				before = before-1;
			}
			
			MemberVO member =  new MemberVO(0, "adminTest"+i, "password"+i, "name"+i, "nickname"+i, 
					i+"email@naver.com", "010-0000-0000", "M", "사용자", "12-25", null);
			memberDAO.memberInsert(member);
		}
		int after = memberDAO.getTotalCount();
		log.info("before :" +before);
		log.info("after :" +after);
		assertThat(before, is(after-100));
		
	}
	
	@Test
	public void getMemberList_Test() {
		Criteria c = new Criteria();
		log.info("totalCount :" +memberDAO.getTotalCount());
		List<MemberVO> mList = adminDAO.getMemberList(c);   // 정확한 페이지를 가져왔다는걸 어떻게 알수있을까?
		log.info("mList :" +mList.get(0).getId());
		assertThat(mList.size(), is(10));
	
	}
	
	
	@After
	public void memberTestFinal() {
		for(int i=0; i<100; i++) {
			memberDAO.deleteById("adminTest"+i);;
		}
	}
	
}
