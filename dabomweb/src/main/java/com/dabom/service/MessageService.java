package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

public interface MessageService {
		
	List<Message> findByPageReceiveMessage(String receiver, int pageNo, int pageSize);
	List<Message> findByPageSendMessage(String sender, int pageNo, int pageSize);
	
	List<Message> findSDeleteReceiveMessage(String receiver, int pageNo, int pageSize);
	List<Message> findSDeleteSendMessage(String sender, int pageNo, int pageSize);
	
	int findMessageReceiveCount(String receiver);	
	int findMessageSendCount(String sender);
	int findMessageDeleteReceiveCount(String receiver);
	int findMessageDeleteSendCount(String sender);

	void writeMessage(Message message);
	
	void DirectwriteMessage(Message message);

	List<Member> findMemberid();

	Message findByMessageNo(int messageNo);

	void delete(int messageNo);


}
