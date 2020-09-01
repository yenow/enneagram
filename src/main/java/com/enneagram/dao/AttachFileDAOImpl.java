package com.enneagram.dao;

import java.util.List;

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

	@Override
	public List<AttachFileDTO> selectAttachList(int bno) {
		return sqlsession.selectList("selectAttachList", bno);
	}

	@Override
	public AttachFileDTO getAttachFile(int mno) {
		return sqlsession.selectOne("getAttachFile", mno);
	}

	@Override
	public void insertAttachFileToMember(AttachFileDTO attachFileDTO) {
		sqlsession.insert("insertAttachFileToMember", attachFileDTO);
	}

	@Override
	public void deleteMemberAttach(int mno) {
		sqlsession.delete("deleteMemberAttach", mno);
	}

	@Override
	public void deleteAttachByAtno(int atno) {
		sqlsession.delete("a_deleteAttachByAtno",atno);
	}

	@Override
	public List<AttachFileDTO> selectAttachListByBno(int bno) {
		return sqlsession.selectList("a_selectAttachListByBno", bno);
	}

}
