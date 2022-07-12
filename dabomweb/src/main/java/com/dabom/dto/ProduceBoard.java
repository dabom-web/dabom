package com.dabom.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProduceBoard {

	private int boardNo; 
	private String infor;
	private String writer;
	private String contact;
	private String sns;
	private Date writedate;
	private Date modifydate;
	private String type;
	private boolean ok;
	private boolean deleted;
	private int supportCnt;
	
	private Member member;
	
	private ProduceSupport produceSupport;
	
	private List<ProducerAttach> files;
	
	
	
	
}