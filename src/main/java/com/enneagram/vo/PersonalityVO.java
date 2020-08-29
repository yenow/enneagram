package com.enneagram.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PersonalityVO {
	
	/*pno int(30),
	mno int(30),
	regdate datetime,
	eclass int(2),*/
	private int pno;
	private int mno;
	private LocalDateTime regdate;
	private int eclass;
	private int type;
	
	private int one;
	private int two;
	private int three;
	private int four;
	private int five;
	private int six;
	private int seven;
	private int eight;
	private int nine;
	
	
	public PersonalityVO() {
		// TODO Auto-generated constructor stub
	}
	public PersonalityVO(int one, int two, int three, int four, int five, int six, int seven, int eight, int nine) {
		super();
		this.one = one;
		this.two = two;
		this.three = three;
		this.four = four;
		this.five = five;
		this.six = six;
		this.seven = seven;
		this.eight = eight;
		this.nine = nine;
	}
	
	
	
}
