package com.dabom.mapper;

import java.util.HashMap;
import java.util.List;

import com.dabom.dto.VideoUpload;

public interface VideoUploadMapper {

	void insertVideo(VideoUpload vUpload);

	List<VideoUpload> selectAll();

	List<VideoUpload> viewerSelectAll();

	VideoUpload selectByVideoNo(int videoNo);

	void update(VideoUpload vUpload);

	void delete(int videoNo);

	List<VideoUpload> selectByUploadRange(HashMap<String, Object> uParams);

	List<VideoUpload> selectByRange(HashMap<String, Object> params);

	void updateVideoReadCount(int videoNo);

	List<VideoUpload> selectHomeList();

}
