package com.dabom.service;

import java.util.HashMap;
import java.util.List;

import com.dabom.dto.VideoComment;
import com.dabom.dto.VideoUpload;
import com.dabom.mapper.VideoCommentMapper;
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
		
		videoUploadMapper.updateVideoReadCount(videoNo);
		vUpload.setReadCount(vUpload.getReadCount() + 1);
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

	@Override
	public List<VideoUpload> findByUploadPage(int uPageNo, int uPageSize) {
		int uFrom = (uPageNo - 1) * uPageSize;
		int uCount = uPageSize;
		
		HashMap<String, Object> uParams = new HashMap<>();
		uParams.put("uFrom", uFrom);
		uParams.put("uCount", uCount);
//		HashMap은 이름 그대로 해싱 (Hashing)을 사용하기 때문에 많은 양의 데이터를 검색하는 데 있어서 뛰어난 성능을 보입니다. 위 그림과 같이 HashMap은 내부에 '키'와 '값'을 저장하는 자료 구조를 가지고 있습니다. HashMap은 해시 함수를 통해 '키'와 '값'이 저장되는 위치를 결정하므로, 사용자는 그 위치를 알 수 없고, 삽입되는 순서와 들어 있는 위치 또한 관계가 없습니다.

		List<VideoUpload> vUploadList = videoUploadMapper.selectByUploadRange(uParams);
		
		return vUploadList;
	}

	@Override
	public List<VideoUpload> findByPage(int pageNo, int pageSize) {
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<VideoUpload> vList = videoUploadMapper.selectByRange(params);
		
		return vList;
	}
	
	/////////////////////////////////////////////////////////////////
	
	@Setter
	private VideoCommentMapper videoCommentMapper;

	@Override
	public void writeVideoComment(VideoComment vComment) {
		videoCommentMapper.insertVideoComment(vComment);
		
	}

	@Override
	public List<VideoComment> findVideoCommentsByVideoNo(int videoNo) {
		List<VideoComment> vComments = videoCommentMapper.selectByVideoNo(videoNo);
		return vComments;
		
	}

	@Override
	public void deleteVideoComment(int vCommentNo) {
		videoCommentMapper.delete(vCommentNo);
		
	}

	@Override
	public void updateVideoComment(VideoComment vComment) {
		videoCommentMapper.update(vComment);
		
	}

	@Override
	public List<VideoUpload> findHomeList() {
		List<VideoUpload> videoList = videoUploadMapper.selectHomeList();
		return videoList;
	}

//	@Override
//	public void writeVideoReComment(VideoComment vComment) {
//		// 댓글의 대상글 정보 조회
//		VideoComment parentVideoComment = videoCommentMapper.selectByVideoCommentNo(vComment.getCommentNo());
//		vComment.
//		
//	}

	
}
