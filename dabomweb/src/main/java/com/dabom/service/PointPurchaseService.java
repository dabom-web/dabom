package com.dabom.service;

import java.util.List;

import com.dabom.dto.PointPurchase;

public interface PointPurchaseService {

	public void purchasePoint(PointPurchase pointPurchase);

	public void plusPointByMemberId(PointPurchase pointPurchase);

	public List<PointPurchase> findPointPurchaseByMemberId(String memberId);
	
	public List<PointPurchase> findPointListByMemberId(String memberId);

	public List<PointPurchase> findPointList(String memberId);

	public int findTotalPriceByMemberId(String memberId);

	public int findTotalAmountByMemberId(String memberId);

	public int findTotalUsePointByMemberId(String memberId);

	public int searchHavePointByLoginUser(String memberId);

	public void usePointByMemberId(String memberId);

	public void usePointByMemberIdInsert(String memberId);

	public int findCumTotlaPointByMemberId(String memberId);

	public void dropdownUsePointByMemberIdInsert(String memberId, int usePoint);

	public void dropdonwUsePointByMemberId(String memberId, int usePoint);

}
