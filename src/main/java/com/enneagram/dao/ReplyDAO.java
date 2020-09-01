package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.ReplyVO;

public interface ReplyDAO {

	void replyInsert(ReplyVO re);
	
	public void replyInsert_no(ReplyVO re);

	List<ReplyVO> listReply(int bno);

	String getPassword(int rno);

	void replyDelete(int rno);

	String getUserId(int rno);

	ReplyVO getReply(int rno);

	void updateReply(ReplyVO re);

	int getTotalCount();

	int getTotalCountBySearch(Criteria c);
}
