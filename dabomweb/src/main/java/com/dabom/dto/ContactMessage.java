package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ContactMessage {

	private int contactNo;
	private String title;
	private String content;
	private Date sendDate;
	private String memberId;
	private String adminId;
	private Boolean readContact;
	private Boolean deleted;
	
	private Member member;
}
