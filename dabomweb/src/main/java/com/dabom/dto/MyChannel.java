package com.dabom.dto;

public class MyChannel {

	private String memberId;
	private String channelName;
	private String uploadMessage;
	private String uploadUrl;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getUploadMessage() {
		return uploadMessage;
	}
	public void setUploadMessage(String uploadMessage) {
		this.uploadMessage = uploadMessage;
	}
	public String getUploadUrl() {
		return uploadUrl;
	}
	public void setUploadUrl(String uploadUrl) {
		this.uploadUrl = uploadUrl;
	}
	
}
