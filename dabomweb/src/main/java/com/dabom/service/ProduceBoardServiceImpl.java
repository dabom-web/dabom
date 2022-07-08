package com.dabom.service;

import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProducerAttach;
import com.dabom.mapper.ProduceBoardMapper;

import lombok.Setter;

public class ProduceBoardServiceImpl implements ProduceBoardService {

	@Setter
	private ProduceBoardService produceBoard;
	
	@Setter
	private ProduceBoardMapper produceBoardMapper;
	
	@Override
	public void writeInfor(ProduceBoard produceBoard) {
		produceBoardMapper.insertProdueceBoard(produceBoard);
		for (ProducerAttach produceAttach : produceBoard.getFiles() ) {
			produceAttach.setProduceBoardNo(produceBoard.getBoardNo());
		    produceBoardMapper.insertProducerAttach(produceAttach);
		}
	}
	
}
