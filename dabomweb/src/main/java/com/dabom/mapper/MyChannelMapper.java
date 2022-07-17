package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;

public interface MyChannelMapper {
	
	/*
	 * @Insert("INSERT INTO channel (member_id, channel_name, channel_info) " +
	 * "VALUES (${member_Id}, ${channel_Name}, ${channel_Info})" )
	 */
	void insertMyChannel(MyChannel myChannel);

	/*
	 * @Select("SELECT member_id, channel_name, channel_info " + "FROM channel " +
	 * "WHERE member_id = ${member_Id}" )
	 */
	MyChannel selectMyChannel(String member_Id);

	// 구독
	@Insert("insert INTO channel_subscribe (member_id, subscriber, subscribe ) "
			+ "values ( #{ member_Id }, #{ subscriber }, #{ subscribe } ) ")		
	void insertChannelSubscribe(@Param("member_Id")String member_Id, @Param("subscriber")String subscriber, @Param("subscribe")int subscribe);

	// 구독 안구독
	@Update("update channel_subscribe "
			+ "set subscribe = #{ subscribe } "
			+ "where member_id = #{ member_Id } and subscriber = #{ subscriber }")
	void updateChannelSubscribe(@Param("member_Id")String member_Id, @Param("subscriber")String subscriber, @Param("subscribe")int subscribe );
		
	// 구독수 증가
	@Update("update channel set subscribe = subscribe + #{ subscribe } where member_id = #{ member_Id }" )
	void updateChannelSubscribeCount(@Param("member_Id")String member_Id, @Param("subscribe")int count );

	// 구독자수 찾기
	@Select("select subscribe from channel where member_id =#{ member_Id }")
	int selectSubscribeCount(@Param("member_Id")String member_Id);
}
