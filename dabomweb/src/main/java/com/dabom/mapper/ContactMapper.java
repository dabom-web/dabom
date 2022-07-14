package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;

public interface ContactMapper {

	@Insert("insert into contact_message (title, member_id, content, admin_id, type) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}, #{type}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertContactAdmin(ContactMessage contactMessage);
	
	@Insert("insert into contact_message (title, member_id, content, admin_id, type) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}, #{type}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertContactUser(ContactMessage contactMessage);

	@Select("select memberid from member")
	List<Member> selectUserMemberId();

	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, type "
			+ "from contact_message where type = 'admin' order by contact_no desc")
	List<ContactMessage> selectAllContactList();

	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, type "
			+ "from contact_message where contact_no = #{ contactNo }")
	ContactMessage selectByContactNo(@Param("contactNo")int contactNo);

	
}
