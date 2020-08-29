package com.enneagram.dao;

import java.util.List;

import com.enneagram.vo.PersonalityVO;

public interface PersonalityDAO {

	void insertPersonality(PersonalityVO p);

	String getEclass(int eclass);

	String getType(Integer type);

	public PersonalityVO getMytype(int mno);

	public List<PersonalityVO> myPersonaltiyList(int mno);

	public PersonalityVO myPersonaltiy(int pno);
	
	int getTotalCount();

}
