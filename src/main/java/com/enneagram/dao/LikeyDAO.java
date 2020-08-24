package com.enneagram.dao;

import com.enneagram.vo.LikeyVO;

public interface LikeyDAO {

	void likeyPlus(Integer bno, int mno);

	LikeyVO getLikey(Integer bno, int mno);

	void likeydelete(Integer bno, int mno);

}
