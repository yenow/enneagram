package com.enneagram.dao;

import java.util.List;

import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

public interface MemberDAO {

	public void memberInsert(MemberVO m);

	public MemberVO login_confirm(String user_id);

	public void memberUpdate(MemberVO memberVO);

	public PersonalityVO getMytype(int mno);

	public List<PersonalityVO> myPersonaltiyList(int mno);
}
