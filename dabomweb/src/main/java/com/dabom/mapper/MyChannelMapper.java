package com.dabom.mapper;

import java.nio.channels.Channel;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.ChannelSubscribe;
import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.dto.MyChannel;
import com.dabom.dto.MyChannelBanner;
import com.dabom.dto.MyChannelCommunity;
import com.dabom.dto.MyChannelProfile;

public interface MyChannelMapper {
	
	/*
	 * @Insert("INSERT INTO channel (member_id, channel_name, channel_info) " +
	 * "VALUES (${member_Id}, ${channel_Name}, ${channel_Info})" )
	 */
	void insertMyChannel(MyChannel myChannel);

	@Insert("INSERT channel_profile (member_id, userfilename, savedfilename) "
			+ "VALUES (#{member_Id}, #{userFileName}, #{savedFileName})")
	void insertMyChannelProfile(MyChannelProfile file);
	
	@Select("SELECT member_id, channel_name, channel_info, subscribe FROM channel WHERE member_id = #{member_Id} " )	 
	MyChannel selectMyChannel(String member_Id);	
	
	@Select("SELECT member_id, subscribe_no, subscriber, subscribe, subscribe_date "
			+ "FROM channel_subscribe WHERE member_id = #{member_Id}" )
	ChannelSubscribe selectSubsribe(String member_Id);
	
	@Select("SELECT member_id, subscribe_no, subscriber, subscribe, subscribe_date "
			+ "FROM channel_subscribe WHERE subscriber = #{subscriber}" )
	ChannelSubscribe selectSubsriber(@Param("subscriber")String memberId); 
	
	@Select("SELECT member_id, subscribe_no, subscriber, subscribe, subscribe_date "
			+ "FROM channel_subscribe WHERE subscriber = #{subscriber}")
	List<ChannelSubscribe> selectMySubscribeList(@Param("subscriber")String member_Id);
	
	@Select("SELECT member_id, subscribe_no, subscriber, subscribe, subscribe_date "
			+ "FROM channel_subscribe WHERE member_id = #{member_Id}")
	List<ChannelSubscribe> selectMySubscribeList2(String member_Id);
		
	@Select("SELECT attachno, member_id, userfilename, savedfilename "
			+ "FROM channel_profile "
			+ "WHERE member_id = #{member_Id}")
	MyChannelProfile selectMyChannelProfile(String member_Id);
	
//	@Select("SELECT attachno, member_id, userfilename, savedfilename "
//			+ "FROM channel_banner "
//			+ "WHERE member_id = #{member_Id}")
//	MyChannelBanner selectMyChannelBanner(String member_Id);

	@Update("UPDATE channel "
			+ "SET channel_name = #{channel_Name} , channel_info = #{channel_Info} "
			+ "WHERE member_id = #{member_Id} ")
	void updateMyChannel(MyChannel myChannel);
	
	@Delete("DELETE FROM channel WHERE member_id = #{member_Id} ")
	void deleteMyChannel(String member_Id);
	
	@Delete("DELETE FROM channel_profile WHERE member_id = #{member_Id} ")
	void deleteMyChannelProfile(String member_Id);
	
	@Delete("DELETE FROM channel_subscribe WHERE member_id = #{member_Id} ")
	void deleteSucribe(String member_Id);
	
	// 구독
	@Insert("INSERT channel_subscribe (member_id, subscriber, subscribe ) "
			+ "values ( #{ member_Id }, #{ subscriber }, #{ subscribe } ) ")		
	void insertChannelSubscribe(@Param("member_Id")String member_Id, @Param("subscriber")String subscriber, @Param("subscribe")int subscribe);

	// 구독 안구독
	@Update(" DELETE FROM channel_subscribe "			
			+ "where member_id = #{ member_Id } and subscriber = #{ subscriber } ")
	void deleteChannelSubscribe(@Param("member_Id")String member_Id, @Param("subscriber")String subscriber);
		
	// 구독수 증가
	@Update("update channel set subscribe = subscribe + #{ subscribe } where member_id = #{ member_Id }" )
	void updateChannelSubscribeCount(@Param("member_Id")String member_Id, @Param("subscribe")int count );

	// 구독자수 찾기
	@Select("select subscribe from channel where member_id =#{ member_Id }")
	int selectSubscribeCount(@Param("member_Id")String member_Id);

	@Select("select COUNT(subscribe) from channel_subscribe where subscriber = #{ subscriber }")
	int selectSubscribeCount2(@Param("subscriber")String member_Id);

	// 메세지
	@Insert("INSERT INTO message (message_title, receiver, sender, message_content) "
			+ "VALUES ( #{message_Title}, #{receiver}, #{sender}, #{message_Content} ) ")	
	void insertDirectMessage(Message message);
	
	@Select("SELECT subscribe_no, member_id, subscribe, subscribe, subscribe_date "
			+ "FROM channel_subscribe "
			+ "WHERE member_id = #{ member_Id } and subscriber = #{subscriber}")
	ChannelSubscribe selectSub(@Param("member_Id")String member_Id, @Param("subscriber")String subscriber);
	
	@Update("UPDATE channel_profile SET userfilename = ${userFileName}, savedfilename = ${savedFileName} where member_id = #{ member_Id }")	
	void updateMyChannelProfile(MyChannelProfile file);

	@Insert("INSERT channel_banner (member_id, userfilename, savedfilename) "
			+ "VALUES (#{member_Id}, #{userFileName}, #{savedFileName}) ")
	void insertMyChannelBanner(MyChannelBanner file);

	
	@Select("SELECT attachno, member_id, userfilename, savedfilename "
			+ "FROM channel_banner "
			+ "WHERE member_id = #{member_Id}")	
	MyChannelBanner selectMyChannelBanner(String member_Id);

	@Insert("INSERT INTO channel_community (member_id, content, groupno, step, depth) "
			+ "VALUES ( #{member_Id}, #{content}, 0, 1, 0)")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "community_No",
	   before = false)	
	void insertCommunity(MyChannelCommunity myChannelCommunity);

	@Select("SELECT community_no, member_id, content, writedate, deleted, groupno, step, depth "
			+ "FROM channel_community "
			+ "WHERE member_id = #{member_Id} and deleted = FALSE "
			+ "ORDER BY community_no DESC" )
	List<MyChannelCommunity> selectCommunity(String member_Id);

	@Delete("UPDATE channel_community "
			+ "SET deleted = TRUE "
			+ "WHERE community_no = #{ community_No }" )
	void delete(int community_No);

	@Update("UPDATE channel_community "
			+ "SET content = #{content} "
			+ "WHERE community_no = #{ community_No } ")
	void update(MyChannelCommunity myChannelCommunity);
	
//	@Select("select member_id, channel_name, channel_info, subscribe from channel order by reg_date desc")
//	List<Channel> selectAllChannel();

	

	

	

	

	

	

	

	

	

	



	

	
	
	
}
