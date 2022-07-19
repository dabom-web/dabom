package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class VideoComment {

	private int commentNo;
	private String comment;
	private Date writeDate;
	private Date modifyDate;
	private boolean deleteComment;
	private int videoNo;
	private String memberId;
	
	// 글의 표시 순서(논리적인 순서) 관리를 위한 변수
	
}
