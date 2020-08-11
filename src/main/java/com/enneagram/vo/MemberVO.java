package com.enneagram.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
/*
create table member(
    mno int(30),
    id varchar(50),
    password varchar(50) not null,
    name varchar(50) not null,
    nickname varchar(50) not null,
    email varchar(200),
    tel varchar(50) not null,
    gender varchar(5) not null,
    category varchar(20) not null,
    birth datetime,
    regdate datetime not null,
    constraint member_mno_pk primary key (mno),
    constraint member_check_gender check (gender in ('남','여')),
    constraint member_check_category check (category in ('관리자','사용자'))
);
 */
	private int mno;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String tel;
	private String gender;
	private String category;
	private String type;
	private Date birth;
	private Date regdate;
	
	
}
