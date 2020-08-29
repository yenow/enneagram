package com.enneagram.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.enneagram.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/test-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class AdminControllerTest {
	
	@Autowired
	WebApplicationContext context;
	
	@InjectMocks
	AdminController controller;

	@Mock
	AdminService mockMessageService;

	MockMvc mockMvc;
	
	@Test
	public void setUpMockMvc() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
}
