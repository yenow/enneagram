package com.anneagram.vo;

import java.util.Date;

public class MemberVO {
/*
 * uno NUMBER(30),
    user_id varchar2(50) primary key,
    user_pw varchar2(50) not null,
    name varchar(50) not null,
    nickname VARCHAR2(50),
    email VARCHAR2(200),
    address VARCHAR2(200) not null, 
    type number(2),
    regdate date
 */
	private int uno;
	private String user_id;
	private String user_pw;
	private String name;
	private String nickname;
	private String email;
	private String address;
	private String tel;
	private int type;
	private Date regdate;
	
	public MemberVO() {
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
