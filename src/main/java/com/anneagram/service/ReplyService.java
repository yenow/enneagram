package com.anneagram.service;

import java.util.List;

import com.anneagram.vo.ReplyVO;

public interface ReplyService {

	void replyInsert(ReplyVO re);

	public void replyInsert_no(ReplyVO re);

	List<ReplyVO> listReply(int bno);

	String getPassword(int rno);

	void replyDelete(int rno);

	String getUserId(int rno);
}
