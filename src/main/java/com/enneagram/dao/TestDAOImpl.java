package com.enneagram.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.vo.PersonalityVO;

@Repository
public class TestDAOImpl implements TestDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertPersonality(PersonalityVO p) {
		sqlSession.insert("p_insert",p);
	}

	@Override
	public String getEclass(int eclass) {
		return sqlSession.selectOne("p_eclass", eclass);
	}

	@Override
	public String getType(Integer type) {
		return sqlSession.selectOne("p_type", type);
	}
}
