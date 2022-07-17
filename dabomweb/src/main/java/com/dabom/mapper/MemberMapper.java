package com.dabom.mapper;

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
	

}
