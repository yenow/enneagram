package com.enneagram.service;

import com.enneagram.vo.LikeyVO;

public interface LikeyService {

	void likeyPlus(Integer bno, int mno);

	LikeyVO getLikey(Integer bno, int mno);

	void likeydelete(Integer bno, int mno);

}
