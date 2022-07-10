package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

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
			+ "from produceboard where type = 'actor' "
			+ "order by boardno desc")
	List<ProduceBoard> selectActor();
	
	@Select("select  boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
			+ "from produceboard where type = 'directer' "
			+ "order by boardno desc")
	List<ProduceBoard> selectDirecter();

//	@Select("select boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
//				 + "memberid, birth, email, username "
//			+ "from  member left outer join produceboard "
//			+ "on member.memberid = produceboard.writer "
//			+ "where boardno = #{ boardNo } and ok = 1")
//	@Result({
//		@Result(id = true, column = "memberid", property = "memberId"),
//		@Result(column = "birth", property = "birth"),
//		@Result(column = "email", property = "email"),
//		@Result(column = "username", property = "userName")
//				many = @Many(resultMap = "")
//	})
	@Select("select boardno, infor, writedate, modifydate, type, ok, deleted, writer, contact, sns "
		+ "from  produceboard "
		+ "where boardno = #{ boardNo } and ok = 1")
	ProduceBoard selectByBoardNo(int boardNo);
	
	@Select("select attachno, produceboardno, userfilename, savedfilename "
			+ "from producer_attach "
			+ "where produceboardno = #{ boardNo }")
	ProducerAttach selectByProducerAttachNo(int attachNo);
	
	

}
