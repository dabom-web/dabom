package com.dabom.service;

import java.util.List;

import com.dabom.dto.Email;
import com.dabom.dto.Member;

public interface AccountService {

	public void registerMember(Member member);
	public Member login(Member member);
	void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName );
	void updateUserType(String memberId, String type);
	public Member selectByMemberIdAndEmail(Member member);
	public Email finId(String memberId, String passwd, String email);
	void deleteAccountByMemberId(String memberId);
	void disabledAccountByMemberId(String memberId);
	public List<Member> findAllMember();
	

}
