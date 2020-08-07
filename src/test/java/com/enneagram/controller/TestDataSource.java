package com.enneagram.controller;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
public class TestDataSource {

	@Inject
	private DataSource dataSoruce;
	
	@Test
	public void test() {
		System.out.println(dataSoruce);
	}
}
