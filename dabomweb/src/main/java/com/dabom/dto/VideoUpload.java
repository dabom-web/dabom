package com.dabom.dto;

import java.util.Date;

import lombok.Data;

@Data	// lombok
public class VideoUpload {

	private int videoNo;
	private String memberId;
	private String videoTitle;
	private String content;
	private Date uploadTime;
	private Date updateTime;
	private String series;
	private int videoType;	// 동영상 분류(movie or dance or song)
	private boolean deleted;
	private int open;
	private int readCount;
	private boolean block;
	private String link;
	private String videoFileName;
	private String videoSavedName;
	private String thumbnailFileName;
	private String thumbnailSavedName;
	
	
}
