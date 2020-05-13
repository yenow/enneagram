package com.anneagram.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.anneagram.service.ReplyService;
import com.anneagram.vo.ReplyVO;

// advanced rest client
@RestController
public class ReplyController {

	private ReplyService replyService;
	
	@RequestMapping("/replyinsert")
	public void replyInsert(ReplyVO re) {
		
	}
	
}
