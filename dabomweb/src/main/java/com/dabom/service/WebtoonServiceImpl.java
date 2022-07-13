package com.dabom.service;

import java.util.HashMap;
import java.util.List;

import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.dto.WebtoonListByTitle;
import com.dabom.dto.WebtoonListByTitleAttach;
import com.dabom.mapper.WebtoonMapper;

import lombok.Setter;

public class WebtoonServiceImpl implements WebtoonService {

	@Setter
	WebtoonMapper webtoonMapper;
	
	public void writeWebtoonBoard(WebtoonBoard webtoonBoard) {
		
		//데이터 입력
		
		webtoonMapper.insertWebtoonBoard(webtoonBoard);
		
		if(webtoonBoard.getFiles() != null) {
			for(WebtoonBoardAttach file : webtoonBoard.getFiles()) {
				file.setBoardNo(webtoonBoard.getBoardNo());
				webtoonMapper.insertWebtoonBoardAttach(file);
			}
		}
		
	};
	
	// 첨부파일 제외 데이터 불러오기
	
	public List<WebtoonBoard> findAll(){
		
		List<WebtoonBoard> boardList = webtoonMapper.selectAll();
		return boardList;
		
	}
	
	
	
	public List<WebtoonBoard> findByPage(int pageNo, int pageSize){
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<WebtoonBoard> boardList = webtoonMapper.selectByRange(params);
		for (WebtoonBoard board : boardList) {
			List<WebtoonBoardAttach> files = webtoonMapper.selectBoardAttachByBoardNo(board.getBoardNo());
			board.setFiles(files);
		}
		return boardList;
		
	};
	
	public int findBoardCount() {

		int count = webtoonMapper.selectBoardCount();
		return count;
		
	};
	
	public WebtoonBoard findByBoardNo(int boardNo) {
		
		WebtoonBoard webtoonBoard = webtoonMapper.selectByBoardNo(boardNo);
		
		List<WebtoonBoardAttach> files = webtoonMapper.selectBoardAttachByBoardNo(boardNo);	// 첨부 파일 데이터 조회
		webtoonBoard.setFiles(files);
		
		return webtoonBoard;
	};
	
	public void writeWebtoonBoardByTitle(WebtoonListByTitle webtoonListByTitle) {
		
	webtoonMapper.insertWebtoonBoardByTitle(webtoonListByTitle);
		
		if(webtoonListByTitle.getFiles() != null) {
			for(WebtoonListByTitleAttach file : webtoonListByTitle.getFiles()) {
				file.setBoardNo(webtoonListByTitle.getBoardNo());
				webtoonMapper.insertWebtoonBoardbyTitleAttach(file);
			}
		}
		
	};
	
}
