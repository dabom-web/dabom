package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.mapper.MessageMapper;

import lombok.Setter;

public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper messageMapper;
	
	@Override
	public List<Message> findAllMessage() {
		
		List<Message> messageList = messageMapper.selectAllMessage();
		return messageList;
	}
	
	@Override
	public int findMessageCount() {
		int count = messageMapper.selectMessageCount();
		return count;
		
	}
	
	@Override
	public void writeMessage(Message message) {
		
		messageMapper.insertMessage(message);
				
	}
	
	@Override
	public List<Member> findMemberid() {
		
		List<Member> memberList = messageMapper.selectReceiver();		
		return memberList;
	}

	@Override
	public Message findByMessageNo(int messageNo) {

		Message message = messageMapper.selectByMessageNo(messageNo);
		
		return message;
	}

}
