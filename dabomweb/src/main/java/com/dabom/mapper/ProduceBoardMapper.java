package com.dabom.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
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

}
