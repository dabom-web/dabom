package com.dabom.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.dto.WebtoonListByTitle;
import com.dabom.dto.WebtoonListByTitleAttach;

public interface WebtoonMapper {

	void insertWebtoonBoard(WebtoonBoard webtoonBoard);
	
	void insertWebtoonBoardAttach(WebtoonBoardAttach webtoonBoardAttach);
	
	List<WebtoonBoard> selectAll();

	List<WebtoonBoard> selectByRange(HashMap<String, Object> params);

	int selectBoardCount();
	
	List<WebtoonBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	WebtoonBoard selectByBoardNo(int boardNo);

	void insertWebtoonBoardByTitle(WebtoonListByTitle webtoonListByTitle);

	void insertWebtoonBoardbyTitleAttach(WebtoonListByTitleAttach file);

	List<WebtoonListByTitle> webtoonListByTitleSelectAll(int boardNo);

	WebtoonListByTitle findByNumber(int number);

	List<WebtoonListByTitleAttach> webtoonListByTitleSelectByNumber(@Param("boardNo") int boardNo,@Param("number") int number);

	List<WebtoonListByTitleAttach> webtoonByTitlefindAttach(int number);

	void delete(int number);
}
