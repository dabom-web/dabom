package com.dabom.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

import lombok.Setter;

@Mapper
public interface MessageMapper {	
	
//	@Select("SELECT message_no, message_title, message_content, send_date, sender, receiver, message_delete "
//		  + "FROM message "
//		  + "WHERE receiver = #{receiver} AND message_delete = FALSE "
//		  + "ORDER BY send_date DESC ")
	List<Message> selectAllReceiveMessage(HashMap<String, Object> params);
//	List<Message> selectAllReceiveMessage(HashMap<String, Object> params);	
	
//	@Select("SELECT message_no, message_title, message_content, send_date, sender, receiver, message_delete "
//			+ "FROM message "
//			+ "WHERE sender = #{sender} AND message_delete = FALSE "
//			+ "ORDER BY send_date DESC ")
//	List<Message> selectAllSendMessage(String sender);
	List<Message> selectAllSendMessage(HashMap<String, Object> params);	
	List<Message> selectReceiveMessageDelete(HashMap<String, Object> params);	
	List<Message> selectSendMessageDelete(HashMap<String, Object> params);	

//	@Select("SELECT COUNT(*) FROM message")
	int selectMessageReceiveCount(String receiver);
	int selectMessageSendCount(String sender);
	int selectReceiveMessageDeleteCount(String receiver);
	int selectSendMessageDeleteCount(String sender);
	
//	@SelectKey(statement = "SELECT LAST_INSERT_ID()",
//			   resultType = Integer.class,
//			   keyProperty = "message_no" ,
//			   before = false)
//	@Insert("INSERT INTO message (receiver, sender, message)" +
//			"VALUES (#{receiver},  #{sender}, #{message}) " )
	void insertMessage(Message message);
	
	void insertDirectMessage(Message message);

//	@Select("SELECT memberid FROM member ") 
	List<Member> selectReceiver();
	
	Message selectByMessageNo(int messageNo);
	
	void deleteByMessageNo(int messageNo);
	
	
	
	
	
	
	
	
	
	

	

}
