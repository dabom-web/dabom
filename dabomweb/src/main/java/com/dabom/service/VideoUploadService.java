package com.dabom.service;

import java.util.List;

import com.dabom.dto.VideoUpload;

public interface VideoUploadService {

	void uploadVideo(VideoUpload vUpload);
	List<VideoUpload> findAll();
	VideoUpload findByVideoNo(int videoNo);
	void delete(int videoNo);
	void update(VideoUpload vUpload);
}
