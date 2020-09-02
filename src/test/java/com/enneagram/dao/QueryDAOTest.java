package com.enneagram.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.domain.QueryNumber;
import com.enneagram.vo.QueryVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
//@ContextConfiguration(value = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class QueryDAOTest {

	@Autowired
	private QueryDAO queryDAO;
	
	@Test
	public void insertQuery() {
		for(int i=1; i<=81 ; i++) {
			QueryVO queryVO = new QueryVO(i,"query"+i,i%9+1);
			queryDAO.insertQueryInsertByQno(queryVO);
		}
		
	}
	
	@Test
	public void selectList() {
		QueryNumber qn = new QueryNumber();
		qn.setPageNum(2);
		qn.setPageNumEndNum();
		List<QueryVO> qlist = queryDAO.selectListQuery(qn);
		log.info("qlist: "+qlist);
	}
	
	
}
