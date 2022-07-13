package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;

public interface ContactMapper {

	@Insert("insert into contact_message (title, member_id, content, admin_id) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertContactAdmin(ContactMessage contactMessage);

	@Select("select memberid from member")
	List<Member> selectUserMemberId();
}
