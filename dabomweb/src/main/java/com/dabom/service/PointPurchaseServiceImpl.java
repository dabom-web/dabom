package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
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
	public List<PointPurchase> findPointList(String memberId) {
		List<PointPurchase> pointList = pointPurchaseMapper.selectPointListAddCumPointByMemberId(memberId);
		return pointList;
	}

	@Override
	public int findCumTotlaPointByMemberId(String memberId) {
		int cumTotalPoint = pointPurchaseMapper.selectCumTotlaPointByMemberId(memberId);
		return cumTotalPoint;
	}

	@Override
	public int findTotalPriceByMemberId(String memberId) {
		int totalPoint = pointPurchaseMapper.selectSumPriceByMemberId(memberId);
		return totalPoint;
	}

	@Override
	public int findTotalAmountByMemberId(String memberId) {
		int totalAmount = pointPurchaseMapper.selectSumAmountByMemberId(memberId);
		return totalAmount;
	}

	@Override
	public int findTotalUsePointByMemberId(String memberId) {
		int totalUsePoint = pointPurchaseMapper.selectSumUsePointByMemberId(memberId);
		return totalUsePoint;
	}


	@Override
	public void usePointByMemberId(String memberId) {
		pointPurchaseMapper.updateUsePointByMemberId(memberId);
	}

	@Override
	public void usePointByMemberIdInsert(String memberId) {
		pointPurchaseMapper.inserUsePointPurchase(memberId);

	}

	@Override
	public void dropdownUsePointByMemberIdInsert(String memberId, int usePoint) {
		pointPurchaseMapper.insertDropdownUsePointByMemberId(memberId, usePoint);

	}

	@Override
	public void dropdonwUsePointByMemberId(String memberId, int usePoint) {
		pointPurchaseMapper.updateDropdownUsePointByMemberId(memberId, usePoint);

	}

	
}
