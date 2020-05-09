package com.anneagram.vo;

import java.util.Date;

public class ReplyVO {
	/*
	rno number(30) primary key,
	bno number(30),
	user_id varchar2(100),
	rcontent varchar2(2000) not null,
	regdate date,
	updatedate date,
	no_user_id varchar2(100),
	no_user_passwd*/
	
	private int rno;
	private int bno;
	private String user_id;
	private String rcontent;
	private Date regdate;
	private Date updatedate;
	private String no_user_id;
	private String no_user_passwd;
	
	
	
	public String getNo_user_id() {
		return no_user_id;
	}

	public void setNo_user_id(String no_user_id) {
		this.no_user_id = no_user_id;
	}

	public String getNo_user_passwd() {
		return no_user_passwd;
	}

	public void setNo_user_passwd(String no_user_passwd) {
		this.no_user_passwd = no_user_passwd;
	}

	public ReplyVO() {
		
	}


	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	
}
