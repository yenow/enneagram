package com.enneagram.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnneagramDAOImpl implements EnneagramDAO {

	@Autowired
	private SqlSession sqlSession;

}
