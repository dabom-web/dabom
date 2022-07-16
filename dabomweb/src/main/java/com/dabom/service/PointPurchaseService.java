package com.dabom.service;

import java.util.List;

import com.dabom.dto.PointPurchase;

public interface PointPurchaseService {
	
	public void purchasePoint(PointPurchase pointPurchase);
	
	public List<PointPurchase> findPointPurchaseByMemberId(String memberId);

	public int findTotalPriceByMemberId(String memberId);
	
	public int findTotalAmountByMemberId(String memberId);
	
	public int findTotalUsePointByMemberId(String memberId);
	
}
