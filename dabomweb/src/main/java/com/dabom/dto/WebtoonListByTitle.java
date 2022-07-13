package com.dabom.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WebtoonListByTitle {

	private int boardNo;
	private int number;
	private String title;
	private String memberId;
	private Date regdate;
	private String content;
	private int readCount;
	private List<WebtoonListByTitleAttach> files;
	
}
