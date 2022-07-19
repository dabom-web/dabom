package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.dabom.dto.Member;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProduceBoardComment;
import com.dabom.dto.ProduceSupport;
import com.dabom.dto.ProducerAttach;

public interface ProduceBoardMapper {		
	 
	@Insert("insert into produceboard (infor, writer, type, contact, sns) "
			+ "values (#{ infor }, #{ writer }, #{ type }, #{ contact }, #{ sns })")
	@SelectKey(statement = "select last_insert_id()",
			   resultType = Integer.class,
			   keyProperty = "boardNo",
			   before = false)	
	void insertProdueceBoard(ProduceBoard produceBoard);
	
	@Insert("insert into producer_attach (produceboardno, userfilename, savedfilename) "
			+ "values (#{ produceBoardNo }, #{ userFileName }, #{ savedFileName })")
	@Options(useGeneratedKeys = true, keyColumn = "attachno", keyProperty = "attachNo")
	void insertProducerAttach(ProducerAttach produceAttach);

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns, support_cnt "
			+ "from produceboard where type = 'actor' and deleted = 0 and ok = 1 "
			+ "order by boardno desc")
	@Results({
		@Result(id= true, column = "boardno", property = "boardNo"),
		@Result(column = "writdate", property = "writdate"),
		@Result(column = "infor", property = "infor"),
		@Result(column = "modifydate", property = "modifydate"),
		@Result(column = "type", property = "type"),
		@Result(column = "ok", property = "ok"),
		@Result(column = "deleted", property = "deleted"),
		@Result(column = "contact", property = "contact"),
		@Result(column = "sns", property = "sns"),
		@Result(column = "support_cnt", property = "supportCnt"),
		@Result(column = "writer", property = "writer"),
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectActor();
	

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns, support_cnt "
			+ "from produceboard where type = 'director' and deleted = 0 and ok = 1 "
			+ "order by boardno desc")
	@Results({
		@Result(id= true, column = "boardno", property = "boardNo"),
		@Result(column = "writdate", property = "writdate"),
		@Result(column = "infor", property = "infor"),
		@Result(column = "modifydate", property = "modifydate"),
		@Result(column = "type", property = "type"),
		@Result(column = "ok", property = "ok"),
		@Result(column = "deleted", property = "deleted"),
		@Result(column = "contact", property = "contact"),
		@Result(column = "sns", property = "sns"),
		@Result(column = "support_cnt", property = "supportCnt"),
		@Result(column = "writer", property = "writer"),
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectDirector();

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns, support_cnt "
			+ "from produceboard where ok = 0 and deleted = 0 "
			+ "order by boardno desc")
	@Results({
		@Result(id= true, column = "boardno", property = "boardNo"),
		@Result(column = "writdate", property = "writdate"),
		@Result(column = "infor", property = "infor"),
		@Result(column = "modifydate", property = "modifydate"),
		@Result(column = "type", property = "type"),
		@Result(column = "ok", property = "ok"),
		@Result(column = "deleted", property = "deleted"),
		@Result(column = "contact", property = "contact"),
		@Result(column = "sns", property = "sns"),
		@Result(column = "support_cnt", property = "supportCnt"),
		@Result(column = "writer", property = "writer"),
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectProuceList();
	
	
	@Select("select boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns, support_cnt supportCnt "
		+ "from  produceboard "
		+ "where boardno = #{ boardNo } ")
	ProduceBoard selectByBoardNo(@Param("boardNo") int boardNo);
	
	@Select("select attachno, produceboardno, userfilename, savedfilename "
			+ "from producer_attach "
			+ "where produceboardno = #{ boardNo }")
	ProducerAttach selectByProducerBoardNo(@Param("boardNo") int boardNo);

	@Select("select memberid, birth, email, username, nickname, emoji, phone, grade, active, point "
			+ "from member "
			+ "where memberid = #{ writer }")
	Member selectMemberInfor(@Param("writer") String writer);

	
	@Update("update produceboard "
			+ "set ok = #{ ok } "
			+ "where boardno = #{ boardNo }")
	void updateAcceptPost(@Param("boardNo") int boardNo, @Param("ok") int ok);

	

	@Insert("insert into produce_support (produceboardno, member_id, support) "
			+ "values (#{ produceBoardNo }, #{ memberId }, #{ support })")
	void insertProducerSupport(@Param("produceBoardNo")int boardNo, @Param("memberId")String memberId, @Param("support")int support); 
	
	@Update("update produce_support "
			+ "set support = #{ support } "
			+ "where member_id = #{ memberId } and produceboardno = #{ produceBoardNo }")
	void updateSupportProducer(@Param("produceBoardNo")int boardNo, @Param("memberId")String memberId, @Param("support")int support);
	
	@Select("select * from produce_support where member_id = #{ memberId } and produceboardno = #{ produceBoardNo }")
	ProduceSupport selectProduceSupportByMemberIdAndProductBoardNo(@Param("memberId")String memberId, @Param("produceBoardNo")int produceBoardNo);

	
	@Select("select support_cnt from produceboard where boardno = #{ boardNo }")
	int selectSupportCountByProduceBoardNo(@Param("boardNo")int boardNo);

	@Update("update produceboard set support_cnt = support_cnt + #{ supportCnt } where boardno = #{ boardNo }")
	void updateSupportCountByProduceBoardNo(@Param("boardNo")int boardNo, @Param("supportCnt")int count);

	@Select("select count(*) from produceboard where ok = 0 and deleted = 0")
	int selectAcceptRequestCount();

	@Select("select boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns, support_cnt "
			+ "from produceboard where boardno = #{ boardNo }")
	@Results({
		@Result(id= true, column = "boardno", property = "boardNo"),
		@Result(column = "writdate", property = "writdate"),
		@Result(column = "infor", property = "infor"),
		@Result(column = "modifydate", property = "modifydate"),
		@Result(column = "type", property = "type"),
		@Result(column = "ok", property = "ok"),
		@Result(column = "deleted", property = "deleted"),
		@Result(column = "contact", property = "contact"),
		@Result(column = "sns", property = "sns"),
		@Result(column = "support_cnt", property = "supportCnt"),
		@Result(column = "writer", property = "writer"),
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	ProduceBoard selectInforByBoardNo(@Param("boardNo")int boardNo);

	
	@Update("update produceboard set "
			+ "sns = #{ sns }, infor = #{ infor }, contact = #{ contact }, modifydate = now() "
			+ "where boardno = #{ boardNo } ")
	void updateInfor(@Param("boardNo")int boardNo, @Param("sns")String sns, @Param("infor")String infor, @Param("contact")String contact);

	@Update("update produceboard set deleted = true where boardno = #{ boardNo }")
	void updateInforDeletedByBoardNo(@Param("boardNo")int boardNo);

	@Insert("insert into produceBoardComment ( content, writer, boardno ) "
			+ "values ( #{ content }, #{ writer }, #{ boardNo } )")
	@SelectKey(statement = "select last_insert_id()",
	   resultType = Integer.class,
	   keyProperty = "boardNo",
	   before = false)	
	void insertCommentByBoardNo(ProduceBoardComment produceBoardComment);

	@Select("select content, writer, boardno boardNo, regdate, commentno commentNo, deleted, groupno, depth, step "
			+ "from produceBoardComment where boardno = #{ boardNo } "
			+ "order by commentno desc")
	List<ProduceBoardComment> selectCommentListByBoardNo(int boardNo);


	

}
