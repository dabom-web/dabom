package com.dabom.mapper;

import java.util.List;

import com.dabom.dto.VideoUpload;

public interface VideoUploadMapper {

	void insertVideo(VideoUpload vUpload);

	List<VideoUpload> selectAll();

	List<VideoUpload> viewerSelectAll();

	VideoUpload selectByVideoNo(int videoNo);

	void update(VideoUpload vUpload);

	void delete(int videoNo);

}
