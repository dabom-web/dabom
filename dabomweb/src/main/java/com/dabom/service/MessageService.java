package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

public interface MessageService {
	
	List<Message> findAllMessage();

	int findMessageCount(); 

	void writeMessage(Message message);

	List<Member> findMemberid();

	Message findByMessageNo(int messageNo);

	

}
