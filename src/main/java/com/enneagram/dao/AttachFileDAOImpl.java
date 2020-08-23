package com.enneagram.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.enneagram.domain.AttachFileDTO;

@Repository
public class AttachFileDAOImpl implements AttachFileDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertAttachFile(AttachFileDTO a) {
		sqlsession.insert("insertAttachFile", a);
		
	}
}
