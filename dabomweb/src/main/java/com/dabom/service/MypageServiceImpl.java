package com.dabom.service;

import com.dabom.mapper.MemberMapper;
import com.dabom.mapper.MypageMapper;

import lombok.Setter;

public class MypageServiceImpl implements MypageService {

	@Setter
	private MemberMapper memberMapper;
	
	@Setter
	private MypageMapper mypageMapper;
	

	@Override
	public void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName) {
		mypageMapper.updateMemberInforByMemberId(memberId, nickName, birth, email, phone, userName);
	}

	@Override
	public void updateUserType(String memberId, String type) {
		mypageMapper.updateUserTypeByMemberId(memberId, type);
	}

	@Override
	public void deleteAccountByMemberId(String memberId) {
		mypageMapper.deleteAcouuntByMemberId(memberId);
		
	}

	@Override
	public void changeUserTypeByMemberId(String memberId, String type) {
		mypageMapper.updateUserTypeByMemberId(memberId, type);
		
	}
	
	
}
