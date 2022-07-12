package com.dabom.mapper;

import java.util.HashMap;
import java.util.List;

import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;

public interface WebtoonMapper {

	void insertWebtoonBoard(WebtoonBoard webtoonBoard);
	
	void insertWebtoonBoardAttach(WebtoonBoardAttach webtoonBoardAttach);
	
	List<WebtoonBoard> selectAll();

	List<WebtoonBoard> selectByRange(HashMap<String, Object> params);

	int selectBoardCount();
	
}
