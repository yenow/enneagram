package com.enneagram.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/test-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class AdminControllerTest {
	private static final Logger LOG = LoggerFactory.getLogger(AdminControllerTest.class);
	
	@Autowired
	public AdminController adminController;
	MockMvc mockMvc;
		
	@Before
    public void setUpMockMvc() {
        this.mockMvc = MockMvcBuilders.standaloneSetup(adminController).build();
    }
	
	@Test
	public void adminLoginTest() throws Exception {
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/login");
		mockMvc.perform(reqBuilder).andExpect(status().isOk()).andExpect(view().name("admin/login")).andDo(print());
		
		// perform 메서드가 ResultActions을 반환
		// andExpect에  ResultMatcher 요게 들어간다.
	}
	
	
}



/*
@Autowired
WebApplicationContext context;

@InjectMocks
AdminController controller;

@Mock
AdminService mockMessageService;
*/
