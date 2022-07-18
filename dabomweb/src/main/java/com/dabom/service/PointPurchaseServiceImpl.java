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
	public void plusPointByMemberId(PointPurchase pointPurchase) {
		pointPurchaseMapper.updatePointPurchase(pointPurchase);
		
	}

	@Override
	public List<PointPurchase> findPointPurchaseByMemberId(String memberId) {
		List<PointPurchase> pointPurchaseList = pointPurchaseMapper.selectPointPurchaseByMemberId(memberId);
		return pointPurchaseList;
	}
	
	@Override
	public List<PointPurchase> findPointListByMemberId(String memberId) {
		List<PointPurchase> pointList = pointPurchaseMapper.selectPointListByMemberId(memberId);
		return pointList;
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


	@Override
	public int searchHavePointByLoginUser(String memberId) {
		int havePoint = pointPurchaseMapper.selectHavePointByMemberId(memberId);
		return havePoint;
	}


	@Override
	public void usePointByMemberId(String memberId) {
		pointPurchaseMapper.updateUsePointByMemberId(memberId);
	}


	@Override
	public void usePointByMemberIdInsert(String memberId) {
		pointPurchaseMapper.inserUsePointPurchase(memberId);
		
	}


//	@Override
//	public void usePointByMemberIdInsert(PointPurchase pointPurchase) {
//		pointPurchaseMapper.insertUsePointByMemberId(pointPurchase);
//	}


	

	
	
}
