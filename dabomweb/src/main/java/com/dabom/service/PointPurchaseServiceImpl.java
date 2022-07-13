package com.dabom.service;

import com.dabom.dto.PointPurchase;
import com.dabom.mapper.PointPurchaseMapper;

import lombok.Setter;

public class PointPurchaseServiceImpl implements PointPurchaseService {

	@Setter
	private PointPurchaseMapper pointPurchaseMapper;

	@Override
	public void purchasePoint(PointPurchase pointPurchase) {
		pointPurchaseMapper.insertPointPurchase(pointPurchase);
	}
	
	
	
}
