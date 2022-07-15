package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;

public interface ContactMapper {

	@Insert("insert into contact_message (title, member_id, content, admin_id, writertype) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}, #{writertype}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertContactAdmin(ContactMessage contactMessage);
	
	@Insert("insert into contact_message (title, member_id, content, admin_id, writertype) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}, #{writertype}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertContactUser(ContactMessage contactMessage);

	@Select("select memberid from member")
	List<Member> selectUserMemberId();

	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where writertype = 'admin' order by contact_no desc")
	List<ContactMessage> selectAllContactList();
	
	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where writertype = 'user' and member_id = #{ memberId } order by contact_no desc")
	List<ContactMessage> selectSendContactListByUser(@Param("memberId")String memberId);
	
	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where writertype = 'user' order by contact_no desc")
	List<ContactMessage> selectContactListToAdmin();
	
	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where writertype = 'admin' and member_id = #{ memberId } order by contact_no desc")
	List<ContactMessage> selectContactListToUser(String memberId);
	
	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where contact_no = #{ contactNo }")
	ContactMessage selectByContactNo(@Param("contactNo")int contactNo);

	@Select("select contact_no contactNo, title, content, send_date sendDate, member_id memberId, admin_id adminId, read_contact readContact, deleted, writertype "
			+ "from contact_message where contact_no = #{ contactNo } and member_id = #{ memberId } and writertype = 'admin' ")	
	ContactMessage selectByContactNoAndMemberId(@Param("contactNo")int contactNo,@Param("memberId")String memberId);

	@Insert("insert into contact_message (title, member_id, content, admin_id, writertype) "
			+ "values (#{title}, #{memberId}, #{content}, #{adminId}, #{writertype}) ")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "contactNo",
	   before = false)	
	void insertReplyContact(ContactMessage contactMessage);

	
	@Select("select count(*) from contact_message "
		  + "where deleted = false and read_contact = false and writertype = 'user'")
	int selectReceivedContactCount();



	
	

	

	
}
