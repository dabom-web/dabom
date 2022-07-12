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

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
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
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectActor();
	
	
	

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
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
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectDirector();

	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
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
		@Result(column = "writer", property = "member",
				one = @One(select="selectMemberInfor"))
	})
	List<ProduceBoard> selectProuceList();
	
	
	@Select("select boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
		+ "from  produceboard "
		+ "where boardno = #{ boardNo } and ok = 1")
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
	



	

}
