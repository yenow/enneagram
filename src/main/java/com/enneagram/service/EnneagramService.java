package com.enneagram.service;

import java.util.List;

import com.enneagram.vo.EnneagramVO;

public interface EnneagramService {

	void insert(EnneagramVO en);

	EnneagramVO select(EnneagramVO en);

	List<EnneagramVO> selectEclassList();

	List<EnneagramVO> selectTypeList();

}
