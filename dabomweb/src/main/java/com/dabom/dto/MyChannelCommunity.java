package com.dabom.dto;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MyChannelCommunity {

	private int community_No;
	private String member_Id;
	private String content;
	private Date writeDate;
	private int deleted;
	
	private int groupNo;	
	private int step;
	private int depth;
	
	
}
