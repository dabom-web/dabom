package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProducerAttach;

public interface ProduceBoardService {

	void writeInfor(ProduceBoard produceBoard);

	List<ProduceBoard> findActorList();

	List<ProduceBoard> findDirectorList();

	ProduceBoard findByBoardNo(int boardNo);

	ProducerAttach findByProducerByBoardNo(int attachNo);

	Member findMemberInfor(String writer);

//	Member findUserName();
	
}
