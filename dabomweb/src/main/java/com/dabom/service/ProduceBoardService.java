package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProduceSupport;
import com.dabom.dto.ProducerAttach;

public interface ProduceBoardService {

	void writeInfor(ProduceBoard produceBoard);

	List<ProduceBoard> findActorList();

	List<ProduceBoard> findDirectorList();

	ProduceBoard findByBoardNo(int boardNo);

	ProducerAttach findByProducerByBoardNo(int attachNo);

	Member findMemberInfor(String writer);

	List<ProduceBoard> findProduceList();

	void updateAcceptPost(int boardNo, int ok);

	void supportProducer(int produceBoardNo, String memberId, int support);

	void insertProducerSupport(int produceBoardNo, String memberId, int support);
	
	ProduceSupport findProduceSupportByMemberIdAndProduceBoardNo(String memberId, int produceBoardNo);

	int findAllSuppourtCount(int boardNo);

	int findAcceptRequestCount();

	void updateProducerSupportCount(int produceBoardNo, int count);

	ProduceBoard findInforByBoardNo(int boardNo);

	void updateInfor(int boardNo, String sns, String infor, String contact);


	
}
