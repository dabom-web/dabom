package com.dabom.dto;

import lombok.Data;

@Data
public class Message {

	private int message_No;
	private String message_Title;
	private String message_Content;
	private String send_Date;
	private boolean message_Delete;
	private String sender;
	private String receiver;	
	
		
}	