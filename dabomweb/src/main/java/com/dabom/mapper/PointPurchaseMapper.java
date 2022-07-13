package com.dabom.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.PointPurchase;

public interface PointPurchaseMapper {		
	 
	@Insert("insert into PointPurchase (memberid, price, amount) "
			+ "values (#{ memberId }, #{ price }, #{ amount })")
	@SelectKey(statement = "select last_insert_id()",
			   resultType = Integer.class,
			   keyProperty = "purchaseNo",
			   before = false)	
	void insertPointPurchase(PointPurchase pointPurchase);
	

}
