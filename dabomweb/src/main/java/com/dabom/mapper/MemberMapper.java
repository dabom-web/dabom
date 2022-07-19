package com.dabom.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;

public interface MemberMapper {

	void insertUser(Member member);
	void insertMember(Member member);
	Member loginUser(Member member);
	
//	@Delete("set foreign_key_checks = 0")
//	@Delete("delete from member where memberid = #{ memberId } ")
//	@Delete("set foreign_key_checks = 1")
	@Update("update member set leved = true where memberid = #{ memberId }")
	void deleteAccountByMemberId(String memberId);
	
	@Update("update member set active = false where memberid = #{ memberId }")
	void updateDisabledAccount(String memberId);
	

	@Update("update member set nickname = #{ nickName }, birth = #{ birth }, email = #{ email }, phone = #{ phone }, username = #{ userName } "
			+ "where memberid = #{ memberId } ")
	void updateMemberInforByMemberId(@Param("memberId")String memberId, @Param("nickName")String nickName,
									 @Param("birth")int birth, @Param("email")String email, 
									 @Param("phone")int phone, @Param("userName")String userName );
	
	@Update("update user set type = #{ type } where memberid = #{ memberId }")
	void updateUserTypeByMemberId(@Param("memberId")String memberId, @Param("type")String type);
	Member selectByMemberIdAndEmail(Member member);
	void updatePasswd(@Param("memberId") String memberId,@Param("passwd") String passwd);
	
	@Select("select user.memberid, nickname, birth, email, phone, passwd, grade, active, username, type, point, leved, block, revenupoint "
			+ "from user left outer join member "
			+ "on user.memberid = member.memberid")
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
		@Result(column="leved", property="leved"),
		@Result(column="block", property="block"),
		@Result(column="revenupoint", property="revenuPoint")
	})	List<Member> selectAllMember();


}
