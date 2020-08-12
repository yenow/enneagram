package com.enneagram.service;

import com.enneagram.vo.EnneagramVO;

public interface EnneagramService {

	void insert(EnneagramVO en);

	EnneagramVO select(EnneagramVO en);

}
