package com.enneagram.dao;

import java.util.List;

import com.enneagram.domain.QueryNumber;
import com.enneagram.vo.QueryVO;

public interface QueryDAO {

	public void insertQueryInsertByQno(QueryVO queryVO);
	
	public QueryVO getQueryByQno(int qno);
	
	public void updateQueryByQno(QueryVO queryVO);
	
	public List<QueryVO> selectListQuery(QueryNumber qn);

	public List<QueryVO> selectQueryListAll();
	
}
