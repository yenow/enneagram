package com.enneagram.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
public class TestSqlSession {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void test() {
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSql() {
		try(SqlSession sqlSession = sqlFactory.openSession()) {
			System.out.println(sqlSession);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
