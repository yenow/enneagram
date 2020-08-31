package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.ReplyVO;

public interface AdminDAO {

	public List<MemberVO> getMemberList(Criteria c);

	public List<BoardVO> getBoardListByCategory(Criteria c);

	public List<BoardVO> getBoardList(Criteria c);

	public List<ReplyVO> getReplyList(Criteria c);
}
