package com.dabom.service;

import java.util.List;

import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.dto.WebtoonListByTitle;

public interface WebtoonService {
	
	public void writeWebtoonBoard(WebtoonBoard webtoonBaord);
	
	public List<WebtoonBoard> findAll();

	public List<WebtoonBoard> findByPage(int pageNo, int pageSize);
	
	public int findBoardCount();

	public WebtoonBoard findByBoardNo(int boardNo);

	public void writeWebtoonBoardByTitle(WebtoonListByTitle webtoonListByTitle);

	public List<WebtoonListByTitle> webtoonByTitlefindAll(int boardNo);

	public WebtoonListByTitle findByNumber(int number);
	
	
}
