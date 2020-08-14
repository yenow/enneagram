package com.enneagram.controller;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.enneagram.dao.BoardDAO;
import com.enneagram.vo.BoardVO;
import com.example.domain.Criteria;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class BoardControllerTest {

	@Autowired
	private BoardDAO boardDAO;

	
	@Setter(onMethod_ = { @Autowired })
	  private WebApplicationContext ctx;

	  private MockMvc mockMvc;

	  @Before
	  public void setup() {
	    this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	  }

	  @Test
	  public void testConvert() throws Exception {
		  BoardVO b = new BoardVO();
		  Criteria c = new Criteria();
		  c.setCategory("공지사항");
		  c.setStart(1);
		  c.setEnd(10);
		  List<BoardVO> blist = boardDAO.selectList(b, c);
		  for(BoardVO a : blist) {
			  System.out.println(a.getNickname());
		  }
		  System.out.println(blist);
	  }

}
