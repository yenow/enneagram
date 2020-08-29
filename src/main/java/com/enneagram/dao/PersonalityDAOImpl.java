package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.vo.PersonalityVO;

@Repository
public class PersonalityDAOImpl implements PersonalityDAO {

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

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("p_getTotalCount");
	}

	@Override
	public PersonalityVO getMytype(int mno) {
		return sqlSession.selectOne("getMytype", mno);
	}

	@Override
	public List<PersonalityVO> myPersonaltiyList(int mno) {
		return sqlSession.selectList("myPersonaltiyList", mno);
	}

	@Override
	public PersonalityVO myPersonaltiy(int pno) {
		return sqlSession.selectOne("myPersonal", pno);
	}
}
