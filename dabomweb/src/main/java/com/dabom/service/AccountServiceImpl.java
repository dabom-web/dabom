package com.dabom.service;


import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.dabom.common.Util;
import com.dabom.dto.Email;
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
	public void deleteAccountByMemberId(String memberId) {
		memberMapper.deleteAccountByMemberId(memberId);
	}


	@Override
	public void disabledAccountByMemberId(String memberId) {
		memberMapper.updateDisabledAccount(memberId);
	}



	@Override
	public void updateMemberInfor(String memberId, String nickName, int birth, String email, int phone, String userName) {
		memberMapper.updateMemberInforByMemberId(memberId, nickName, birth, email, phone, userName);
	}

	@Override
	public void updateUserType(String memberId, String type) {
		memberMapper.updateUserTypeByMemberId(memberId, type);
	}
	
	public Member selectByMemberIdAndEmail(Member member) {
		memberMapper.selectByMemberIdAndEmail(member);
		return member;
	};

	// 메일 내용 생성, 임시비밀번호로 회원 비밀번호 변경
	
	public Email finId(String memberId, String passwd, String email) {
		
		String str = getTempPassword();
		Email dto = new Email();
		
		dto.setAddress(email);
		dto.setTitle("DABOM 임시비밀번호 안내 이메일 입니다");
		dto.setMessage("안녕하세요 DABOM 임시비밀번호 안내 관련 이메일 입니다. 회원님의 임시비밀번호는" + str + "입니다");
		
		str = Util.getHashedString(str, "SHA-256");
		
		passwd = str;
		// 비밀번호 업데이트
		memberMapper.updatePasswd(memberId, passwd);
		
		return dto;
	};
	
	////////////////////////////////////////////////////////////////////////////////////
	
	//랜덤 함수로 임시비밀번호 구문 만들기
	
	public String getTempPassword() {
		char[] charSet = new char[] {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
		
		String str = "";
		
		int idx = 0;
		for(int i =0; i<10; i++) {
			idx = (int)(charSet.length*Math.random());
			str += charSet[idx];
		}
		
		return str;
	}
	
	
	

}
