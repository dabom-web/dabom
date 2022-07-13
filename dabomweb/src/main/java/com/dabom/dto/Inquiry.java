package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Inquiry {

	private int inquiryNo;
	private String title;
	private String content;
	private Date sendDate;
	private String memberId;
	private String adminId;
	
}
