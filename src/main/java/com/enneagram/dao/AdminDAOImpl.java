package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberVO> getMemberList(Criteria c){
		return sqlSession.selectList("a_getMemberList", c);
	}
}
