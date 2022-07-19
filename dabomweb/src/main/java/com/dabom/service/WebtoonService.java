package com.dabom.service;

import java.util.ArrayList;
import java.util.List;

import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.dto.WebtoonListByTitleComment;
import com.dabom.dto.WebtoonListByTitle;
import com.dabom.dto.WebtoonListByTitleAttach;

public interface WebtoonService {
	
	public void writeWebtoonBoard(WebtoonBoard webtoonBaord);
	
	public List<WebtoonBoard> findAll();

	public List<WebtoonBoard> findByPage(int pageNo, int pageSize);
	
	public int findBoardCount();

	public WebtoonBoard findByBoardNo(int boardNo);

	public void writeWebtoonBoardByTitle(WebtoonListByTitle webtoonListByTitle);

	public List<WebtoonListByTitle> webtoonByTitlefindAll(int boardNo);

	public WebtoonListByTitle findByNumber(int number);

	public List<WebtoonListByTitleAttach> webtoonByTitlefindAttach(int number);

	public void delete(int number);

	public void deleteAttach(int number);

	public void update(WebtoonListByTitle webtoonListByTitle);

	public void updateWebtoonBoardByTitle(ArrayList<WebtoonListByTitleAttach> files);

	public void writeWebtoonComment(WebtoonListByTitleComment webtoonComment);

	public List<WebtoonListByTitleComment> findCommentsByNumber(int number);

	


	
	
}
