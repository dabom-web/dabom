package com.dabom.dto;

public class Message {

	private int message_No;
	private String message_Title;
	private String message_Content;
	private String send_Date;
	private boolean message_Delete;
	private String sender;
	private String receiver;
	
	public int getMessage_No() {
		return message_No;
	}
	public void setMessage_No(int message_No) {
		this.message_No = message_No;
	}
	public String getMessage_Title() {
		return message_Title;
	}
	public void setMessage_Title(String message_Title) {
		this.message_Title = message_Title;
	}
	public String getMessage_Content() {
		return message_Content;
	}
	public void setMessage_Content(String message_Content) {
		this.message_Content = message_Content;
	}
	public String getSend_Date() {
		return send_Date;
	}
	public void setSend_Date(String send_Date) {
		this.send_Date = send_Date;
	}
	public boolean isMessage_Delete() {
		return message_Delete;
	}
	public void setMessage_Delete(boolean message_Delete) {
		this.message_Delete = message_Delete;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
		
}	