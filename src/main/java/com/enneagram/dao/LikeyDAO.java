package com.enneagram.dao;

import java.util.List;

import com.enneagram.vo.LikeyVO;

public interface LikeyDAO {

	void likeyPlus(Integer bno, int mno);

	LikeyVO getLikey(Integer bno, int mno);

	void likeydelete(Integer bno, int mno);

	List<LikeyVO> getLikeyByBno(int bno);

	void likeyDeleteByLno(int lno);

	List<LikeyVO> getLikeyByMno(int mno);

	void likeyDeleteByMno(int mno);
	
	void likeyDeleteByBno(int bno);

}
