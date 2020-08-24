package com.enneagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enneagram.dao.BoardDAO;
import com.enneagram.dao.LikeyDAO;
import com.enneagram.vo.LikeyVO;

@Service
public class LikeyServiceImpl implements LikeyService {

	@Autowired
	private LikeyDAO likeyDAO;
	@Autowired
	private BoardDAO boardDAO;

	@Transactional
	@Override
	public void likeyPlus(Integer bno, int mno) {
		likeyDAO.likeyPlus(bno,mno);
		boardDAO.likeyPlus(bno);
	}

	
	@Override
	public LikeyVO getLikey(Integer bno, int mno) {
		return likeyDAO.getLikey(bno,mno);
	}

	@Transactional
	@Override
	public void likeydelete(Integer bno, int mno) {
		likeyDAO.likeydelete(bno,mno);
		boardDAO.likeydelete(bno);
	}
}
