package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.dto.WebtoonBoard;

public interface MypageService {

	void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName);

	void updateUserType(String memberId, String type);

	void deleteAccountByMemberId(String memberId);

	void changeUserTypeByMemberId(String memberId, String type);

	Member selectUpdateByMemberId(String memberId);

	MyChannel findMyChannelByLoginUserMemberId(String memberId);

	List<WebtoonBoard> findWebtoonListByMemberIdOfWriter(String memberId);
	
}
