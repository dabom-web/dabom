package com.dabom.dto;

import java.util.Date;

public class ProduceBoard {

	private int boardNo; 
	private String title; 
	private String content;
	private Date writedate;
	private Date modifydate;
	private String type;
	private boolean ok;
	private boolean deleted;
	private int produceNo;
	private int performerNo;
	private String writer;
	
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public int getProduceNo() {
		return produceNo;
	}
	public void setProduceNo(int produceNo) {
		this.produceNo = produceNo;
	}
	public int getPerformerNo() {
		return performerNo;
	}
	public void setPerformerNo(int performerNo) {
		this.performerNo = performerNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
