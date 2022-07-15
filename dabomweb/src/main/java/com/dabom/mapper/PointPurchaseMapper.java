package com.dabom.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.PointPurchase;

public interface PointPurchaseMapper {		
	 
	@Insert("insert into PointPurchase (memberid, price, amount)" 
			+ "values (#{ memberId }, #{ price }, #{ amount })")
	@SelectKey(statement = "select last_insert_id()",
			   resultType = Integer.class,
			   keyProperty = "purchaseNo",
			   before = false)	
	void insertPointPurchase(PointPurchase pointPurchase);
	
	@Select("select memberid, price, amount, purchase_date purchaseDate, cancel_date cancelDate " +
			"from PointPurchase " +
			"where memberid = #{ memberId } " +
			"order by purchase_date desc")
	List<PointPurchase> selectPointPurchaseByMemberId(@Param("memberId") String memberId);
	

}
