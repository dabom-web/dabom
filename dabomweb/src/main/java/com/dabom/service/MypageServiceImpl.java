package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.dto.WebtoonBoard;
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

	@Override
	public Member selectUpdateByMemberId(String memberId) {
		Member member2 = mypageMapper.selectUpdateByMemberId(memberId);
		return member2;
	}

	@Override
	public MyChannel findMyChannelByLoginUserMemberId(String memberId) {
		MyChannel myChannel = mypageMapper.selectMyChannelByMemberId(memberId);
		return myChannel;
	}


	@Override
	public List<WebtoonBoard> findWebtoonListByMemberIdOfWriter(String memberId) {
		List<WebtoonBoard> titleList = mypageMapper.selectTitleListByMemberIdOfWriter(memberId);
		return titleList;
	}
	
	
}
