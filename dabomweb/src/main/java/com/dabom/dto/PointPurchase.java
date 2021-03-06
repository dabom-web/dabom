package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PointPurchase {

	private int purchaseNo;
	private int amount;
	private int price;
	private Date purchaseDate;
	private Date cancelDate;
	private Date useDate;
	private String memberId;
	private Boolean accept;
	private int usePoint;
	private int totalPoint;
	private int cumTotalPoint;
	
	private Member member;
}
