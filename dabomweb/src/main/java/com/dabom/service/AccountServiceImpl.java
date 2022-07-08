package com.dabom.service;


import com.dabom.dto.Member;
import com.dabom.mapper.MemberMapper;

import lombok.Setter;


public class AccountServiceImpl implements AccountService {

	@Setter
	private MemberMapper memberMapper;
	
	
	public void registerMember(Member member) {
		
		memberMapper.insertUser(member);
		memberMapper.insertMember(member);
		
	}


	@Override
	public Member login(Member member) {
		
		Member member2 = memberMapper.loginUser(member);
		
		return member2;
	}
	
}
