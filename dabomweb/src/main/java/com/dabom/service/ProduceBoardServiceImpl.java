package com.dabom.service;

import java.util.List;

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

	@Override
	public List<ProduceBoard> findActorList() {
		List<ProduceBoard> actorList = produceBoardMapper.selectActor();
		return actorList;
	}

	@Override
	public List<ProduceBoard> findDirecterList() {
		List<ProduceBoard> directerList = produceBoardMapper.selectDirecter();
		return directerList;
	}

	@Override
	public ProduceBoard findByBoardNo(int boardNo) {
		ProduceBoard produceBoard = produceBoardMapper.selectByBoardNo(boardNo);
		return produceBoard;
	}

	@Override
	public ProducerAttach findByProducerAttachNo(int attachNo) {
		ProducerAttach producerAttach = produceBoardMapper.selectByProducerAttachNo(attachNo);
		return producerAttach;
	}
	

	
}
