package com.dabom.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

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

	@Select("SELECT open open, video_no videoNo, video_type videoType, thumbnail_file_name thumbnailFileName, thumbnail_saved_name thumbnailSavedName, video_title videoTitle, upload_time uploadTime, update_time updateTime, read_count readCount, member_id memberId "
			+ "FROM upload_video "
			+ "WHERE open <> '비공개' "
			+ "ORDER BY upload_time DESC")
	List<VideoUpload> selectNewUploadList();

}
