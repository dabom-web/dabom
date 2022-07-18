package com.dabom.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;

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

	@Select("select user.memberid, nickname, birth, email, phone, passwd, grade, active, username, type, point, leved  "
			+ "from user left outer join member "
			+ "on user.memberid = member.memberid "
			+ "where user.memberid = #{ memberId }")
	@Results({
		@Result(id= true, column = "memberid", property = "memberId"),
		@Result(column="type", property="type"),
		@Result(column="nickname", property="nickName"),
		@Result(column="birth", property="birth"),
		@Result(column="email", property="email"),
		@Result(column="phone", property="phone"),
		@Result(column="active", property="active"),
		@Result(column="point", property="point"),
		@Result(column="grade", property="grade"),
		@Result(column="leved", property="leved")
	})
	Member selectUpdateByMemberId(String memberId);
	
	
	
	


	
	
}
