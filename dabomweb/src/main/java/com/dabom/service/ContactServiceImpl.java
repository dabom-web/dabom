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
	public void sendContactUser(ContactMessage contactMessage) {
		contactMapper.insertContactUser(contactMessage);
		
	}
	
	@Override
	public List<Member> findUserMemberList() {
		List<Member> memberList = contactMapper.selectUserMemberId();
		return memberList;
	}

	@Override
	public List<ContactMessage> findAllContactList() {
		 List<ContactMessage> contactList = contactMapper.selectAllContactList();
		return contactList;
	}

	@Override
	public List<ContactMessage> findSendContactListByUser(String memberId) {
		 List<ContactMessage> contactList = contactMapper.selectSendContactListByUser(memberId);
		return contactList;
	}
	
	@Override
	public List<ContactMessage> findContactListToAdmin() {
		 List<ContactMessage> contactList = contactMapper.selectContactListToAdmin();
		return contactList;
	}
	
	@Override
	public List<ContactMessage> findContactListToUser(String memberId) {
		 List<ContactMessage> contactList = contactMapper.selectContactListToUser(memberId);
		return contactList;
	}
	
	@Override
	public ContactMessage findByContactNo(int contactNo) {
		ContactMessage contactMessage = contactMapper.selectByContactNo(contactNo);
		return contactMessage;
	}

	@Override
	public ContactMessage findByContactNoAndMemberId(int contactNo, String memberId) {
		ContactMessage contactMessage = contactMapper.selectByContactNoAndMemberId(contactNo, memberId);
		return contactMessage;
	}

	@Override
	public void sendReplyContact(ContactMessage contactMessage) {
		contactMapper.insertReplyContact(contactMessage);
		
	}

	@Override
	public int findReceivedContactMessageCount() {
		int count = contactMapper.selectReceivedContactCount();
		return count;
	}

	

	
	



	
	
	
}
