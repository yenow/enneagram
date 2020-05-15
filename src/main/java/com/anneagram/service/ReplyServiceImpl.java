package com.anneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anneagram.dao.BoardDAO;
import com.anneagram.dao.ReplyDAO;
import com.anneagram.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void replyInsert(ReplyVO re) {
		replyDAO.replyInsert(re);
		boardDAO.replycnt(re);
	}

	@Override
	public void replyInsert_no(ReplyVO re) {
		replyDAO.replyInsert_no(re);
		boardDAO.replycnt(re);
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		return replyDAO.listReply(bno);
	}

}
