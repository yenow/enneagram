package com.enneagram.db;

import org.apache.commons.logging.Log;

import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.controller.LogExample;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value =  "file:src/main/webapp/WEB-INF/spring/test-context.xml")
public class TestContext {
	private static final Log LOG = LogFactory.getLog( LogExample.class );
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void testSqlSession() {
		LOG.info(sqlSession.toString());
	}
	 
}
