package com.enneagram.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.QueryNumber;
import com.enneagram.vo.QueryVO;

@Repository
public class QueryDAOImpl implements QueryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertQueryInsertByQno(QueryVO queryVO) {
		sqlSession.insert("q_insertQueryInsertByQno",queryVO);
	}
	
	public QueryVO getQueryByQno(int qno) {
		return sqlSession.selectOne("q_getQueryByQno", qno);
	}
	
	public void updateQueryByQno(QueryVO queryVO) {
		sqlSession.update("q_updateQueryByQno", queryVO);
	}
	
	public List<QueryVO> selectListQuery(QueryNumber qn){
		return sqlSession.selectList("q_selectListQuery", qn);
	}

	@Override
	public List<QueryVO> selectQueryListAll() {
		return sqlSession.selectList("q_selectQueryListAll");
	}
	
}
