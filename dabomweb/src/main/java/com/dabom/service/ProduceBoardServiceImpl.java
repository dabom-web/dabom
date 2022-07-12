package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
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
	public List<ProduceBoard> findDirectorList() {
		List<ProduceBoard> directorList = produceBoardMapper.selectDirector();
		return directorList;
	}

	@Override
	public ProduceBoard findByBoardNo(int boardNo) {
		ProduceBoard produceBoard = produceBoardMapper.selectByBoardNo(boardNo);
		return produceBoard;
	}

	@Override
	public ProducerAttach findByProducerByBoardNo(int boardNo) {
		ProducerAttach producerAttach = produceBoardMapper.selectByProducerBoardNo(boardNo);
		return producerAttach;
	}

	@Override
	public Member findMemberInfor(String writer) {
		Member member = produceBoardMapper.selectMemberInfor(writer);
		return member;
	}

	@Override
	public List<ProduceBoard> findProduceList() {
		List<ProduceBoard> produceList = produceBoardMapper.selectProuceList();
		return produceList;
	}

	@Override
	public void updateAcceptPost(int boardNo, int ok) {
		produceBoardMapper.updateAcceptPost(boardNo, ok);
	}


	
}
