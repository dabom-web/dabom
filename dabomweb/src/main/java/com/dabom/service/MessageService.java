package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

public interface MessageService {
	
	List<Message> findAllMessage(String receiver);
	
	List<Message> findAllSendMessage(String sender);
	
//	List<Message> findAllSendMessage(String sender, int pageNo, int pageSize);

	int findMessageReceiveCount(String receiver);
	
	int findMessageSendCount(String sender);

	void writeMessage(Message message);
	
	void DirectwriteMessage(Message message);

	List<Member> findMemberid();

	Message findByMessageNo(int messageNo);

	

	

}
