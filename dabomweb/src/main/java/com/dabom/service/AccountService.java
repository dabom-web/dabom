package com.dabom.service;

import com.dabom.dto.Member;

public interface AccountService {
	
	public void registerMember(Member member);
	public Member login(Member member);
	public void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName );
	public void updateUserType(String memberId, String type);
	
	
}
