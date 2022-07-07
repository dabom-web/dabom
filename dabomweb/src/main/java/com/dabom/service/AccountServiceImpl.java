package com.dabom.service;

import com.dabom.dto.Member;
import com.dabom.mapper.MemberMapper;

public class AccountServiceImpl {

	private MemberMapper memberMapper;
	
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	public void registerMember(Member member) {
		
		memberMapper.insertMember(member);
		
	}
	
}
