package com.enneagram.service;

import com.enneagram.vo.PersonalityVO;

public interface TestSerivce {

	void insertPersonality(PersonalityVO p);

	String getEclass(int eclass);

	String getType(Integer integer);

}
