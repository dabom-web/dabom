package com.dabom.dto;

public class Message {

	private int messageNo;
	private String message;
	private String sendDate;
	private boolean messageDelete;
	private String sender;
	private String receiver;
	
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public boolean isMessageDelete() {
		return messageDelete;
	}
	public void setMessageDelete(boolean messageDelete) {
		this.messageDelete = messageDelete;
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
