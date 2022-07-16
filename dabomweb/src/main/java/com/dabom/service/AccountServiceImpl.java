package com.dabom.service;


import com.dabom.common.Util;
import com.dabom.dto.Member;
import com.dabom.mapper.MemberMapper;

import lombok.Setter;


public class AccountServiceImpl implements AccountService {

	@Setter
	private MemberMapper memberMapper;
	
	
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
	public void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName) {
		memberMapper.updateMemberInforByMemberId(memberId, nickName, birth, email, phone, userName);
	}

	@Override
	public void updateUserType(String memberId, String type) {
		memberMapper.updateUserTypeByMemberId(memberId, type);
	}
	
}
