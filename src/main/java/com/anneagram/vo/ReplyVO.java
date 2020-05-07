package com.anneagram.vo;

import java.util.Date;

public class ReplyVO {
	/*
	rno number(30) primary key,
	bno number(30),
	user_id varchar2(100),
	rcontent varchar2(2000) not null,
	regdate date,
	updatedate date,*/
	
	private int rno;
	private int bno;
	private String user_id;
	private String rcontent;
	private Date regdate;
	private Date updatedate;
	
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int rno, int bno, String user_id, String rcontent, Date regdate, Date updatedate) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.user_id = user_id;
		this.rcontent = rcontent;
		this.regdate = regdate;
		this.updatedate = updatedate;
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
