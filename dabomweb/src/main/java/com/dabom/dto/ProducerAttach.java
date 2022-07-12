package com.dabom.dto;

public class ProducerAttach {

	private int attachNo;
	private String userFileName;
	private String savedFileName;
	private int produceBoardNo;
	
	public int getAttachNo() {
		return attachNo;
	}
	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}
	public String getUserFileName() {
		return userFileName;
	}
	public void setUserFileName(String userFileName) {
		this.userFileName = userFileName;
	}
	public String getSavedFileName() {
		return savedFileName;
	}
	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}
	public int getProduceBoardNo() {
		return produceBoardNo;
	}
	public void setProduceBoardNo(int produceBoardNo) {
		this.produceBoardNo = produceBoardNo;
	}
	
}
