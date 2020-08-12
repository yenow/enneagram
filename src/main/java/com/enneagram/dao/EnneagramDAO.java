package com.enneagram.dao;

import java.util.List;

import com.enneagram.vo.EnneagramVO;

public interface EnneagramDAO {

	void insert(EnneagramVO en);

	EnneagramVO select(EnneagramVO en);

	List<EnneagramVO> selectEclassList();

	List<EnneagramVO> selectTypeList();

}
