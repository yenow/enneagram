package com.enneagram.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "password")
public class MemberVO {

	private int mno;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String tel;
	private String gender;
	private String category;
	private String birth;
	private Date regdate;
	
	
	
}
