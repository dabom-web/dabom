package com.dabom.service;

import java.util.List;

import com.dabom.dto.VideoUpload;
import com.dabom.mapper.VideoUploadMapper;

import lombok.Setter;

public class VideoUploadServiceImpl implements VideoUploadService {

	@Setter
	private VideoUploadMapper videoUploadMapper;
	
	@Override
	public void uploadVideo(VideoUpload vUpload) {
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 movieNo : 없음
		videoUploadMapper.insertVideo(vUpload);	// c1. c2. 를 반영해서 insertVideo에서 movieNo를 조회하도록 구현
		// c2. 이 위치에서 boardNo : 데이터베이스에 있음... 위에 작업 실행함과 동시에 DB 생성 ( 데이터베이스의 movieNo를 조회할 필요 O )
		
		// 첨부파일 데이터를 DB에 저장
		
	}

	@Override
	public List<VideoUpload> findAll() {
		List<VideoUpload> vUploadList = videoUploadMapper.selectAll();
		return vUploadList;
	}

	@Override
	public VideoUpload findByVideoNo(int videoNo) {
		VideoUpload vUpload = videoUploadMapper.selectByVideoNo(videoNo);
		return vUpload;
		
	}

	@Override
	public void delete(int videoNo) {

		videoUploadMapper.delete(videoNo);
		
	}

	@Override
	public void update(VideoUpload vUpload) {
		
		videoUploadMapper.update(vUpload);
	}

	@Override
	public List<VideoUpload> viewerFindAll() {
		List<VideoUpload> vList = videoUploadMapper.viewerSelectAll();
		return vList;
	}

	
}
