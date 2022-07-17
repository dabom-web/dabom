package com.dabom.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.PointPurchase;

public interface PointPurchaseMapper {		
	 
	@Insert("insert into PointPurchase (memberid, price, amount, purchase_date) " 
			+ "values (#{ memberId }, #{ price }, #{ amount }, now())")
	@SelectKey(statement = "select last_insert_id()",
			   resultType = Integer.class,
			   keyProperty = "purchaseNo",
			   before = false)
	void insertPointPurchase(PointPurchase pointPurchase);
	
	@Update("update member set point = point + #{ amount } where memberid = #{ memberId }")
	void updatePointPurchase(PointPurchase pointPurchase);
	
	
	@Select("select memberid, price, amount, purchase_date purchaseDate, cancel_date cancelDate, accept, use_point usePoint, use_date useDate, total_point totalPoint " +
			"from PointPurchase " +
			"where memberid = #{ memberId } " +
			"order by purchase_date desc")
	List<PointPurchase> selectPointPurchaseByMemberId(@Param("memberId")String memberId);

	@Select("select memberid, price, amount, purchase_date purchaseDate, cancel_date cancelDate, accept, use_point usePoint, use_date useDate, total_point totalPoint "
			+ "from PointPurchase where memberid = #{ memberId } "
			+ "order by purchase_date desc")
	List<PointPurchase> selectPointListByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(price) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectSumPriceByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(amount) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectSumAmountByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(use_point) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectSumUsePointByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(amount) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectHavePointByMemberId(String memberId);

//	@Insert("insert into PointPurchase (memberid, amount, use_date) " 
//			+ "values (#{ memberId }, #{ amount }, now())")
//	@SelectKey(statement = "select last_insert_id()",
//	   resultType = Integer.class,
//	   keyProperty = "purchaseNo",
//	   before = false)
//	void insertUsePointByMemberId(PointPurchase pointPurchase);
	
	@Insert("insert into PointPurchase (memberid, amount, use_date) " 
			+ "values (#{ memberId }, 500, now())")
	@SelectKey(statement = "select last_insert_id()",
			   resultType = Integer.class,
			   keyProperty = "purchaseNo",
			   before = false)
	void inserUsePointPurchase(String memberId);
	@Update("update member set point = point - 500 where memberid = #{ memberId }")
	void updateUsePointByMemberId(String memberId);










	
	
	
	
}
