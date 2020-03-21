package com.anneagram.user;

public class UserVO {
	/*
	create table user(
		id varchar(20) primary key ,
	    pw varchar(20) not null,
	    name varchar(20) not null,
	    nickname varchar(20) not null,
	    age int(10) not null,
	    birthday varchar(20),
	    address varchar(40) ,
	    pnumber varchar(30) not null,
	    pwhint varchar(30) not null
	*/
	
	String id;
	String pw;
	String name;
	String nickname;
	int age;
	String birthday;
	String address;
	String pnumber;
	String pwhint;
	
	public UserVO() {
		// TODO Auto-generated constructor stub
	}

	public UserVO(String id, String pw, String name, String nickname, int age, String birthday, String address,
			String pnumber, String pwhint) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.age = age;
		this.birthday = birthday;
		this.address = address;
		this.pnumber = pnumber;
		this.pwhint = pwhint;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getPwhint() {
		return pwhint;
	}

	public void setPwhint(String pwhint) {
		this.pwhint = pwhint;
	}
	
	
	
}
