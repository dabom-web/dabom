package com.dabom.service;

import java.util.List;

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

	@Override
	public List<PointPurchase> findPointPurchaseByMemberId(String memberId) {
		List<PointPurchase> pointPurchaseList = pointPurchaseMapper.selectPointPurchaseByMemberId(memberId);
		return pointPurchaseList;
	}

	@Override
	public int findTotalPriceByMemberId(String memberId) {
		int totalPrice = pointPurchaseMapper.selectSumPriceByMemberId(memberId);
		return totalPrice;
	}
	
	@Override
	public int findTotalAmountByMemberId(String memberId) {
		int totalPrice = pointPurchaseMapper.selectSumAmountByMemberId(memberId);
		return totalPrice;
	}
	
	@Override
	public int findTotalUsePointByMemberId(String memberId) {
		int totalPrice = pointPurchaseMapper.selectSumUsePointByMemberId(memberId);
		return totalPrice;
	}
	
	
}
