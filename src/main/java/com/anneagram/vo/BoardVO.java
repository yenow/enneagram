package com.anneagram.vo;

import java.text.SimpleDateFormat;
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
	/* 데이터 베이스 구조*/
	private int bno;     
	private String user_id;
	private String nickname;
	private String title;
	private String content;
	private int cnt;     // 조회수
	private Date regdate;   
	private Date moddate;
	private int start;
	private int end;
	private int rcnt;    // 댓글 수
	private String s_regdate;
	
	/* */
	private String search;
	private String search_type;
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public String getSearch() {
		return search;
	}



	public void setSearch(String search) {
		this.search = search;
	}



	public String getSearch_type() {
		return search_type;
	}



	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}



	public String getS_regdate() {
		return s_regdate;
	}



	public void setS_regdate(String s_regdate) {
		this.s_regdate = s_regdate;
	}



	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
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
