package com.dabom.service;

import java.util.List;

import com.dabom.dto.VideoUpload;

public interface VideoUploadService {

	void uploadMovie(VideoUpload vUpload);
	List<VideoUpload> findAll();
	VideoUpload findByMovieNo(int movieNo);
	void delete(int movieNo);
	void update(VideoUpload vUpload);
}
