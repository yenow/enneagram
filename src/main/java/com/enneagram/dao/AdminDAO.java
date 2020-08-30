package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.MemberVO;

public interface AdminDAO {

	public List<MemberVO> getMemberList(Criteria c);
}
