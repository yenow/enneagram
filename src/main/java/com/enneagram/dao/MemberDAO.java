package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

public interface MemberDAO {

	public void memberInsert(MemberVO m);

	public MemberVO getMemberById(String id);

	public void memberUpdate(MemberVO memberVO);

	public MemberVO isPresent(String id);

	public MemberVO getMemberVO(int mno);

	public void deleteALL();

	public int getTotalCount();

	public void deleteById(String string);

	public int getTotalCountBySearch(Criteria c);
}
