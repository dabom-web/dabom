package com.dabom.service;

import java.util.List;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;
import com.dabom.mapper.ContactMapper;

import lombok.Setter;

public class ContactServiceImpl implements ContactService {

	@Setter
	private ContactService contactService;
	
	@Setter
	private ContactMapper contactMapper;

	@Override
	public void sendContactAdmin(ContactMessage contactMessage) {
		contactMapper.insertContactAdmin(contactMessage);		
	}

	@Override
	public List<Member> findUserMemberList() {
		List<Member> memberList = contactMapper.selectUserMemberId();
		return memberList;
	}
	
	
}
