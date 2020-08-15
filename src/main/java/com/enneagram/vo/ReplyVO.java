package com.enneagram.vo;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
	private int rno;    // 
	private int bno;
	private int mno;
	private int rrno;
	private int category;
	private String nickname;
	private String rname;   // 댓글 쓴 사람 아이디
	private String rpassword; 
	private String content;   // 댓글 내용
	private LocalDateTime  regdate;     // 등록일
	

	
	
	
}
