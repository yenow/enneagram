package com.enneagram.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private int bno;   
	private int mno;  
	private String title;
	private String content;
	private String category;
	private int cnt;     // 조회수
	private int rcnt;  //  댓글 수
	private Date regdate;   
	private Date moddate;
	private int likey;
	private int type;
	private int start;
	private int end;
	private String id;
	private String nickname;

	private String search;
	private String search_type;
	
	
}
