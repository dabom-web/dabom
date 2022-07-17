package com.dabom.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;

public interface MemberMapper {

	void insertUser(Member member);
	void insertMember(Member member);
	Member loginUser(Member member);
	

	@Update("update member set nickname = #{ nickName }, birth = #{ birth }, email = #{ email }, phone = #{ phone }, username = #{ userName } "
			+ "where memberid = #{ memberId } ")
	void updateMemberInforByMemberId(@Param("memberId")String memberId, @Param("nickName")String nickName,
									 @Param("birth")int birth, @Param("email")String email, 
									 @Param("phone")int phone, @Param("userName")String userName );
	
	@Update("update user set type = #{ type } where memberid = #{ memberId }")
	void updateUserTypeByMemberId(@Param("memberId")String memberId, @Param("type")String type);
	Member selectByMemberIdAndEmail(Member member);
	void updatePasswd(@Param("memberId") String memberId,@Param("passwd") String passwd);


}
