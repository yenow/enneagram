package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.vo.EnneagramVO;

@Repository
public class EnneagramDAOImpl implements EnneagramDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(EnneagramVO en) {
		sqlSession.insert("e_insert", en);
		
	}

	@Override
	public EnneagramVO select(EnneagramVO en) {
		if(en.getCategory().equals("eclass")) {
			return sqlSession.selectOne("e_select_eclass", en);
		}else if(en.getCategory().equals("type")) {
			return sqlSession.selectOne("e_select_type", en);
		}else {
			return sqlSession.selectOne("e_select", en);
		}
		
	}

	@Override
	public List<EnneagramVO> selectEclassList() {
		return sqlSession.selectList("eclass_list");
	}

	@Override
	public List<EnneagramVO> selectTypeList() {
		return sqlSession.selectList("type_list");
	}

}
