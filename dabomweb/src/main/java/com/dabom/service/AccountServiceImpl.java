package com.dabom.service;


import com.dabom.common.Util;
import com.dabom.dto.Member;
import com.dabom.mapper.MemberMapper;

import lombok.Setter;


public class AccountServiceImpl implements AccountService {

	@Setter
	private MemberMapper memberMapper;
	
	
	@Override
	public void registerMember(Member member) {
		
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256");
		member.setPasswd(passwd);
		
		memberMapper.insertUser(member);
		memberMapper.insertMember(member);
		
	}


	@Override
	public Member login(Member member) {
		
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256");
		member.setPasswd(passwd);
		
		Member member2 = memberMapper.loginUser(member);
		
		return member2;
	}


	@Override
	public void deleteAccountByMemberId(String memberId) {
		memberMapper.deleteAccountByMemberId(memberId);
	
	}


	@Override
	public void disabledAccountByMemberId(String memberId) {
		memberMapper.updateDisabledAccount(memberId);
	}


}
