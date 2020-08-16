package com.enneagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enneagram.dao.BoardDAO;
import com.enneagram.dao.ReplyDAO;
import com.enneagram.vo.ReplyVO;

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

	@Override
	public String getPassword(int rno) {
		
		return replyDAO.getPassword(rno);
	}

	@Override
	public void replyDelete(int rno) {
		replyDAO.replyDelete(rno);		
	}

	@Override
	public String getUserId(int rno) {
		return replyDAO.getUserId(rno);
	}

	@Override
	public ReplyVO getReply(int rno) {
		return replyDAO.getReply(rno);
	}

}
