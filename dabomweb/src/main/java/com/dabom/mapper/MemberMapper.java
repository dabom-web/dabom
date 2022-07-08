package com.dabom.mapper;

import com.dabom.dto.Member;

public interface MemberMapper {

	void insertUser(Member member);
	void insertMember(Member member);
	Member loginUser(Member member);

}
