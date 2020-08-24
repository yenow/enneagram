package com.enneagram.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.vo.LikeyVO;

@Repository
public class LikeyDAOImpl implements LikeyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void likeyPlus(Integer bno, int mno) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("bno", bno);
		map.put("mno", mno);
		sqlSession.insert("likeyPlus", map);
	}

	@Override
	public LikeyVO getLikey(Integer bno, int mno) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("bno", bno);
		map.put("mno", mno);
		return sqlSession.selectOne("getLikey", map);
	}

	@Override
	public void likeydelete(Integer bno, int mno) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("bno", bno);
		map.put("mno", mno);
		sqlSession.insert("likeydelete", map);
	}
	
}
