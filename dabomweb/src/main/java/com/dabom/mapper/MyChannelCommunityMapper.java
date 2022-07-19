package com.dabom.mapper;

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

public interface MyChannelCommunityMapper {

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
			+ "ORDER BY community_no DESC")
	List<MyChannelCommunity> selectCommunity(String member_Id);

	@Delete("UPDATE channel_community "
			+ "SET deleted = TRUE "
			+ "WHERE community_no = #{ community_No }" )
	void delete(int community_No);

	@Update("UPDATE channel_community "
			+ "SET content = #{content} "
			+ "WHERE community_no = #{ community_No } ")
	void update(MyChannelCommunity myChannelCommunity);
	
	

	

	

	

	

	

	

	

	

	

	



	

	
	
	
}
