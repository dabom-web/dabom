package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WebtoonListByTitleComment {

	private int commentNo;
	private String writer;
	private String content;
	private Date regDate;
	private int number;
	

}
