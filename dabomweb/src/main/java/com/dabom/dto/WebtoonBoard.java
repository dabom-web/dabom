package com.dabom.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WebtoonBoard {
	
	private int boardNo;
	private String title;
	private String content;
	private Date regdate;
	private int readCount;
	private boolean deleted;
	private String memberId;
	private List<WebtoonBoardAttach> files;
}
