package com.dabom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dabom.dto.VideoComment;

public interface VideoCommentMapper {

	void insertVideoComment(VideoComment vComment);

	List<VideoComment> selectByVideoNo(int videoNo);
	List<VideoComment> selectRangeByVideoNo(@Param("videoNo")int videoNo, @Param("from")int from, @Param("count")int count);
	int selectVideoCommentCount();
	void delete(int vCommentNo);

	void update(VideoComment vComment);

}
