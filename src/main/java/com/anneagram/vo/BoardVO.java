package com.anneagram.vo;

import java.util.Date;

public class BoardVO {
	/*
	 * bno number(30) primary key, 
	 * user_id varchar2(50), 
	 * title varchar2(200)
	 * content varchar2(4000), 
	 * cnt number(30) default 0, 
	 *regdate date,
      moddate date
	 */ 
	private int bno;     
	private String user_id;
	private String title;
	private String content;
	private int cnt;     // 조회수
	private Date regdate;   
	private Date moddate;
	private int start;
	private int end;
	private int rcnt;    // 댓글 수
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public int getRcnt() {
		return rcnt;
	}



	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}



	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	
	
	
}
