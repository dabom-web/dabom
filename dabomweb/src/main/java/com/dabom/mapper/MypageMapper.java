package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.dto.WebtoonBoard;

public interface MypageMapper {


	@Update("update member set nickname = #{ nickName }, birth = #{ birth }, email = #{ email }, phone = #{ phone }, username = #{ userName } "
			+ "where memberid = #{ memberId } ")
	void updateMemberInforByMemberId(@Param("memberId")String memberId, @Param("nickName")String nickName,
									 @Param("birth")int birth, @Param("email")String email, 
									 @Param("phone")int phone, @Param("userName")String userName );
	
	@Update("update user set type = #{ type } where memberid = #{ memberId }")
	void updateUserTypeByMemberId(@Param("memberId")String memberId, @Param("type")String type);

	
	@Delete("set foreign_key_checks = 0 "
			+ "delete FROM member WHERE memberid = #{ memberId } "
			+ "set foreign_key_checks = 1")
	void deleteAcouuntByMemberId(@Param("memberId")String memberId);

	@Select("select user.memberid, nickname, birth, email, phone, passwd, grade, active, username, type, point, leved  "
			+ "from user left outer join member "
			+ "on user.memberid = member.memberid "
			+ "where user.memberid = #{ memberId }")
	@Results({
		@Result(id= true, column = "memberid", property = "memberId"),
		@Result(column="type", property="type"),
		@Result(column="nickname", property="nickName"),
		@Result(column="birth", property="birth"),
		@Result(column="email", property="email"),
		@Result(column="phone", property="phone"),
		@Result(column="active", property="active"),
		@Result(column="point", property="point"),
		@Result(column="grade", property="grade"),
		@Result(column="leved", property="leved")
	})
	Member selectUpdateByMemberId(String memberId);
	
	
	@Select("select channel_name channel_Name, channel_info channel_Info, subscribe, reg_date reg_Date "
			+ "from channel where member_id = #{ memberId }")
	MyChannel selectMyChannelByMemberId(@Param("memberId")String memberId);
	
//	@Select("select boardno, title, content, regdate, readcount, memberid "
//			+ "from webtoon_board where memberid = #{ memberId } "
//			+ "order by boardno desc")
	@Select("select wb.boardno, wb.title, wb.regdate, max(wl.content) content, sum(wl.readcount) readCount "
	+ "from webtoon_board wb "
	+ "left outer join webtoonlistbytitle wl "
	+ "on wb.boardno = wl.boardno "
	+ "where wb.memberid = #{ memberId }")
	@Results({
		@Result(id= true, column = "boardno", property = "boardNo"),
		@Result(column="title", property="title"),
		@Result(column="content", property="content"),
		@Result(column="regdate", property="regdate"),
		@Result(column="readcount", property="readCount"),
		@Result(column="deleted", property="deleted"),
		@Result(column="memberid", property="memberId"),
		@Result(column="boardno", property="WebtoonListByTitle",
				many = @Many(resultMap = "webtoonListByTitle"))
	})
	List<WebtoonBoard> selectTitleListByMemberIdOfWriter(String memberId);
	
	@Results(id="webtoonListByTitle", value = {
		@Result(id = true, column = "boardno", property = "boardNo"),
		@Result(id = true, column = "number", property = "number"),
		@Result(column = "title", property="title"),
		@Result(column = "content", property="content"),
		@Result(column = "regdate", property="regdate"),
		@Result(column = "readcount", property="readCount"),
		@Result(column = "deleted", property="deleted"),
		@Result(column = "memberid", property="memberId"),
		@Result(column = "boardno", property="boardNo")
	})
	void webtoonListByTitle();		
	


	
	
}
