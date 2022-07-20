package com.dabom.service;

import java.util.List;

import com.dabom.dto.VideoComment;
import com.dabom.dto.VideoUpload;

public interface VideoUploadService {

	void uploadVideo(VideoUpload vUpload);
	List<VideoUpload> findAll();	//1
	VideoUpload findByVideoNo(int videoNo);
	void delete(int videoNo);	//2
	void update(VideoUpload vUpload);	//3
	List<VideoUpload> viewerFindAll();	//1
	List<VideoUpload> findByUploadPage(int uPageNo, int uPageSize, String memberId);	//4
	List<VideoUpload> findByPage(int pageNo, int pageSize);	//4
	void writeVideoComment(VideoComment vComment);
	List<VideoComment> findVideoCommentsByVideoNo(int movieNo);
	void deleteVideoComment(int vCommentNo);
	void updateVideoComment(VideoComment vComment);
//	void writeVideoReComment(VideoComment vComment);
	List<VideoUpload> findHomeList();
	
	
}
