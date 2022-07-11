package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.Member;
import com.dabom.dto.Message;

@Mapper
public interface MessageMapper {	
	
//	@Select("SELECT message_no, message, send_date, sender, receiver " +
//			"FROM message " +
//			"ORDER BY send_date DESC ")
	List<Message> selectAllMessage();

//	@Select("SELECT COUNT(*) FROM message")
	int selectMessageCount();
	
//	@SelectKey(statement = "SELECT LAST_INSERT_ID()",
//			   resultType = Integer.class,
//			   keyProperty = "message_no" ,
//			   before = false)
//	@Insert("INSERT INTO message (receiver, sender, message)" +
//			"VALUES (#{receiver},  #{sender}, #{message}) " )
	void insertMessage(Message message);

//	@Select("SELECT memberid FROM member ") 
	List<Member> selectReceiver();
	
	Message selectByMessageNo(int messageNo);

	

}
