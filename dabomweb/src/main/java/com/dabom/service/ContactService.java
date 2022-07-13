package com.dabom.service;

import java.util.List;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;

public interface ContactService {

	void sendContactAdmin(ContactMessage contactMessage);

	List<Member> findUserMemberList();

}
