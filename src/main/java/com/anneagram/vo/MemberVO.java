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
	private String type;
	private Date regdate;
	private int one;
	private int two;
	private int three;
	private int four;
	private int five;
	private int six;
	private int seven;
	private int eight;
	private int night;
	private Date type_regdate;
	/*
	number(30),
	two number(30),
	three number(30),
	four number(30),
	five number(30),
	six number(30),
	seven number(30),
	eight number(30),
	night number(30)
	*/
	public MemberVO() {
	}

	
	public Date getType_regdate() {
		return type_regdate;
	}


	public void setType_regdate(Date type_regdate) {
		this.type_regdate = type_regdate;
	}


	public int getOne() {
		return one;
	}


	public void setOne(int one) {
		this.one = one;
	}


	public int getTwo() {
		return two;
	}


	public void setTwo(int two) {
		this.two = two;
	}


	public int getThree() {
		return three;
	}


	public void setThree(int three) {
		this.three = three;
	}


	public int getFour() {
		return four;
	}


	public void setFour(int four) {
		this.four = four;
	}


	public int getFive() {
		return five;
	}


	public void setFive(int five) {
		this.five = five;
	}


	public int getSix() {
		return six;
	}


	public void setSix(int six) {
		this.six = six;
	}


	public int getSeven() {
		return seven;
	}


	public void setSeven(int seven) {
		this.seven = seven;
	}


	public int getEight() {
		return eight;
	}


	public void setEight(int eight) {
		this.eight = eight;
	}


	public int getNight() {
		return night;
	}


	public void setNight(int night) {
		this.night = night;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
