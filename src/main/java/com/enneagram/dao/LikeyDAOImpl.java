package com.enneagram.dao;

import java.util.HashMap;
import java.util.List;
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

	@Override
	public List<LikeyVO> getLikeyByBno(int bno) {
		return sqlSession.selectList("l_getLikeyByBno", bno);
	}

	@Override
	public void likeyDeleteByLno(int lno) {
		sqlSession.delete("l_likeyDeleteByLno", lno);
	}

	@Override
	public List<LikeyVO> getLikeyByMno(int mno) {
		return sqlSession.selectList("l_getLikeyByMno", mno);
	}

	@Override
	public void likeyDeleteByMno(int mno) {
		sqlSession.delete("l_likeyDeleteByMno", mno);
		
	}

	@Override
	public void likeyDeleteByBno(int bno) {
		sqlSession.delete("l_likeyDeleteByBno", bno);
	}
	
}
