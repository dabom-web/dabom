package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

public interface MessageService {
	
	List<Message> findAllMessage(String receiver);
	
	List<Message> findAllSendMessage(String sender);

	int findMessageReceiveCount(String receiver);
	
	int findMessageSendCount(String sender);

	void writeMessage(Message message);

	List<Member> findMemberid();

	Message findByMessageNo(int messageNo);

	

}
