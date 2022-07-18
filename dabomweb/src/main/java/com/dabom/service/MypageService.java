package com.dabom.service;

public interface MypageService {

	void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName);

	void updateUserType(String memberId, String type);

	void deleteAccountByMemberId(String memberId);

	void changeUserTypeByMemberId(String memberId, String type);
	
}
