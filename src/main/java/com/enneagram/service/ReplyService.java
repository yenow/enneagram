package com.enneagram.service;

import java.util.List;

import com.enneagram.vo.ReplyVO;

public interface ReplyService {

	void replyInsert(ReplyVO re);

	public void replyInsert_no(ReplyVO re);

	List<ReplyVO> listReply(int bno);

	String getPassword(int rno);

	void replyDelete(int rno, int bno);

	String getUserId(int rno);

	ReplyVO getReply(int rno);

	void updateReply(ReplyVO re);
}
