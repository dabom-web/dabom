package com.dabom.service;

import java.util.List;

import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProducerAttach;

public interface ProduceBoardService {

	void writeInfor(ProduceBoard produceBoard);

	List<ProduceBoard> findActorList();

	List<ProduceBoard> findDirecterList();

	ProduceBoard findByBoardNo(int boardNo);

	ProducerAttach findByProducerAttachNo(int attachNo);
	
}
