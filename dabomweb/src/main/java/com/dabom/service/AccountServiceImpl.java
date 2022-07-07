package com.dabom.service;

import com.dabom.dto.Member;
import com.dabom.mapper.MemberMapper;

import lombok.Setter;

public class AccountServiceImpl {

	@Setter
	private MemberMapper memberMapper;
	
	
	public void registerMember(Member member) {
		
		memberMapper.insertMember(member);
		
	}
	
}
