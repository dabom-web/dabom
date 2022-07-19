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

	@Select("select purchase_no purchaseNo, memberid, price, amount, purchase_date purchaseDate, cancel_date cancelDate, accept, use_point usePoint, use_date useDate, total_point totalPoint "
			+ "from PointPurchase where memberid = #{ memberId } "
			+ "order by purchaseNo desc")
	List<PointPurchase> selectPointListByMemberId(@Param("memberId")String memberId);
	
	@Select("select purchase_no, price, amount, use_point, purchase_date purchaseDate, cancel_date cancelDate, accept, use_point usePoint, use_date useDate, "
														 + "(select sum(pp2.amount) - sum(pp2.use_point) "
														 + "from PointPurchase pp2 "
													 	 + "where pp2.purchase_no <= pp1.purchase_no "
														 + "and pp2.memberid = #{ memberId })cumTotalPoint "
			+ "from PointPurchase pp1 "
			+ "where memberid = #{ memberId } "
			+ "order by purchase_no desc")
	List<PointPurchase> selectPointListAddCumPointByMemberId(String memberId);
	
	@Select("select point from member where memberid = #{ memberId }")
	int selectSumPriceByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(amount) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectSumAmountByMemberId(@Param("memberId")String memberId);
	
	@Select("select sum(use_point) from PointPurchase where accept = true and memberid = #{ memberId }")
	int selectSumUsePointByMemberId(@Param("memberId")String memberId);
	
		
	@Insert("insert into PointPurchase (memberid, use_point, use_date) " 
			+ "values (#{ memberId }, 500, now())")	
	void inserUsePointPurchase(String memberId);
	@Update("update member set point = point - 500 where memberid = #{ memberId }")
	void updateUsePointByMemberId(String memberId);

	int selectCumTotlaPointByMemberId(String memberId);

	@Insert("insert into PointPurchase (memberid, use_point, use_date) " 
			+ "values (#{ memberId }, #{ usePoint }, now())")	
	void insertDropdownUsePointByMemberId(@Param("memberId")String memberId, @Param("usePoint")int usePoint);
	@Update("update member set point = point - #{ usePoint } where memberid = #{ memberId }")
	void updateDropdownUsePointByMemberId(@Param("memberId")String memberId, @Param("usePoint")int usePoint);










	
	
	
	
}
