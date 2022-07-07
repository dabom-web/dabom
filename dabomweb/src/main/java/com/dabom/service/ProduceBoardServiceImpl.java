package com.dabom.service;

import com.dabom.mapper.ProduceBoardMapper;

import lombok.Setter;

public class ProduceBoardServiceImpl {

	@Setter
	private ProduceBoardService produceBoard;
	
	@Setter
	private ProduceBoardMapper produceBoardMapper;
	
	public void writeDirecterInfor(ProduceBoardService produceBoard) {
		produceBoardMapper.insertProdueceBoard(produceBoard);
	}
	
}
