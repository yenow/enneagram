package com.enneagram.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
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

import com.enneagram.dao.AdminDAOTest;
import com.enneagram.dao.MemberDAO;
import com.enneagram.testcase.MemberTestCase;
import com.enneagram.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/test-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class AdminControllerTest {
	private static final Logger LOG = LoggerFactory.getLogger(AdminControllerTest.class);
	
	@Autowired
	public AdminController adminController;
	@Autowired
	MemberDAO memberDAO;
	MockMvc mockMvc;

		
	@Before
    public void setUpMockMvc() {
        this.mockMvc = MockMvcBuilders.standaloneSetup(adminController).build();
    }
	
	@Test
	public void adminLoginTest() throws Exception {
	
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/login");
		mockMvc.perform(reqBuilder).andExpect(status().isOk()).andExpect(view().name("admin/login")).andDo(print());
		
		// perform ???????????? ResultActions??? ??????
		// andExpect???  ResultMatcher ?????? ????????????.
	}
	
	@Test
	public void memberManage_Test() throws Exception {
		MemberTestCase mtc= new MemberTestCase(memberDAO);
		mtc.TestCaseInput();
		
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/memberManage").param("pageNum", "2").param("insertCategory", "id").param("search", "admin");
		mockMvc.perform(reqBuilder).andExpect(status().isOk()).andDo(print());
		
		mtc.TestCaseOutput();
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
