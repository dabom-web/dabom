package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {

	
	private String memberId;
	private int memberNo;
	private String userName;
	private String nickName;
	private String emoji;
	private int birth;
	private String email;
	private int phone;
	private String grade;
	private boolean active;
	private int point;
	private int accountno;
	private String passwd;
	private String type;
	private Boolean leved;
	private String gender;
	private Boolean block;
	private int revenuPoint;
	private Date regdate;
	
	private Member member;
	private MyChannel myChannel;
}
