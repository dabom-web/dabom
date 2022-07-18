package com.dabom.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface MypageMapper {


	@Update("update member set nickname = #{ nickName }, birth = #{ birth }, email = #{ email }, phone = #{ phone }, username = #{ userName } "
			+ "where memberid = #{ memberId } ")
	void updateMemberInforByMemberId(@Param("memberId")String memberId, @Param("nickName")String nickName,
									 @Param("birth")int birth, @Param("email")String email, 
									 @Param("phone")int phone, @Param("userName")String userName );
	
	@Update("update user set type = #{ type } where memberid = #{ memberId }")
	void updateUserTypeByMemberId(@Param("memberId")String memberId, @Param("type")String type);

	
	@Delete("set foreign_key_checks = 0 "
			+ "delete FROM member WHERE memberid = #{ memberId } "
			+ "set foreign_key_checks = 1")
	void deleteAcouuntByMemberId(@Param("memberId")String memberId);


	
	
}