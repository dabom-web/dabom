package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProduceBoardComment {
	
	private int commentNo;
	private String content;
	private String writer;
	private int boardNo;
	private Date regdate;
	private Boolean deleted;
	private int groupno;
	private int depth;
	private int step;
	
}
