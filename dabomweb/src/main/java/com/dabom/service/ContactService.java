package com.dabom.service;

import java.util.List;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;

public interface ContactService {

	void sendContactAdmin(ContactMessage contactMessage);

	void sendContactUser(ContactMessage contactMessage);

	List<Member> findUserMemberList();

	List<ContactMessage> findAllContactList();

	List<ContactMessage> findContactListToAdmin();

	List<ContactMessage> findContactListToUser(String memberId);

	ContactMessage findByContactNo(int contactNo);

	List<ContactMessage> findSendContactListByUser(String memberId);

	ContactMessage findByContactNoAndMemberId(int contactNo, String memberId);

	void sendReplyContact(ContactMessage contactMessage);

	int findReceivedContactMessageCount();

}
