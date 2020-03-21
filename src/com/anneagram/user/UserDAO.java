package com.anneagram.user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO implements IUserDAO {

	DataSource ds;
	private UserDAO dao = new UserDAO();
	
	private UserDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/Anneagram");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public UserDAO getInstance() {
		if(dao == null) {
			dao = new UserDAO();
		}
		return dao;
	}
	
	
	
	@Override
	public void insert(UserVO vo) {
		
		String sql = "insert into anneagram values (?,?,?,?,?,?,?,?,?,)";
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);){
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickname());
			pstmt.setInt(5, vo.getAge());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getPnumber());
			pstmt.setString(9, vo.getPwhint());
			
			int rn =pstmt.executeUpdate();
			if(rn ==1) System.out.print("sql 실행성공");
			else System.out.print("sql 실행실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserVO login(String id) {
		
		return null;
	}

}
