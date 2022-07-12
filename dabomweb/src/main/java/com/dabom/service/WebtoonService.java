package com.dabom.service;

import java.util.List;

import com.dabom.dto.WebtoonBoard;

public interface WebtoonService {
	
	public void writeWebtoonBoard(WebtoonBoard webtoonBaord);
	
	public List<WebtoonBoard> findAll();

	public List<WebtoonBoard> findByPage(int pageNo, int pageSize);
	
	public int findBoardCount();
}
