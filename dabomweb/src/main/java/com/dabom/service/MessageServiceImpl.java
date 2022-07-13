package com.dabom.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.mapper.MessageMapper;

import lombok.Setter;


public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper messageMapper;
	
	@Override
	public List<Message> findByPageReceiveMessage(String receiver, int pageNo, int pageSize) {		
		
		int from = (pageNo - 1) * pageSize;
		int sendCount = pageSize;
				
		HashMap<String, Object> params = new HashMap<>();		
		params.put("receiver", receiver);
		params.put("from", from);
		params.put("sendCount",sendCount);
		
		List<Message> messageList = messageMapper.selectAllReceiveMessage(params);
		return messageList;
}

	@Override
	public List<Message> findByPageSendMessage(String sender, int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int sendCount = pageSize;
				
		HashMap<String, Object> params = new HashMap<>();		
		params.put("sender", sender);
		params.put("from", from);
		params.put("sendCount",sendCount);
				
		List<Message> messageList2 = messageMapper.selectAllSendMessage(params);
		return messageList2;
	}
	
	@Override
	public List<Message> findSDeleteReceiveMessage(String receiver) {
		List<Message> messageList3 = messageMapper.selectReceiveMessageDelete(receiver);
		return messageList3;
	}
	
	@Override
	public List<Message> findSDeleteSendMessage(String sender) {
		
		List<Message> messageList4 = messageMapper.selectSendMessageDelete(sender);
		return messageList4;
	}

	
	@Override
	public int findMessageReceiveCount(String receiver) {
		int receiveCount = messageMapper.selectMessageReceiveCount(receiver);
		return receiveCount;
		
	}
	
	@Override
	public int findMessageSendCount(String sender) {
		int sendCount = messageMapper.selectMessageSendCount(sender);
		return sendCount;
		
	}
	@Override
	public int findMessageDeleteReceiveCount(String receiver) {
		int deleteReceiveCount = messageMapper.selectReceiveMessageDeleteCount(receiver);
		return deleteReceiveCount;
	}
	
	@Override
	public int findMessageDeleteSendCount(String sender) {
				
		int deleteSendCount = messageMapper.selectSendMessageDeleteCount(sender);
		return deleteSendCount;
	}
	
	@Override
	public void writeMessage(Message message) {
		
		messageMapper.insertMessage(message);
				
	}
	
	@Override
	public void DirectwriteMessage(Message message) {
		
		messageMapper.insertDirectMessage(message);
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

	@Override
	public void delete(int messageNo) {
		
		messageMapper.deleteByMessageNo(messageNo);
	}

}
