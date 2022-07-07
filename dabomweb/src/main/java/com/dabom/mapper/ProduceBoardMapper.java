package com.dabom.mapper;

import org.apache.ibatis.annotations.Insert;

import com.dabom.service.ProduceBoardService;

public interface ProduceBoardMapper {		
	 
	@Insert("insert")
	void insertProdueceBoard(ProduceBoardService produceBoard);

}
