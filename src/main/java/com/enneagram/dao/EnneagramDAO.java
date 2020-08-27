package com.enneagram.dao;

import com.enneagram.vo.EnneagramVO;

public interface EnneagramDAO {

	void insert(EnneagramVO en);

	EnneagramVO select(EnneagramVO en);

	void delete(EnneagramVO en);

}
