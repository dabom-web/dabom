package com.dabom.dto;

import java.util.Date;

public class VideoUpload {

	private int movieNo;
	private String memberId;
	private String content;
	private Date uploadTime;
	private Date updateTime;
	private String series;
	private int movieType;	// 동영상 분류(movie or dance or song)
	private boolean deleted;
	private int open;
	private int readCount;
	private boolean block;
	private String link;
	private String videoFileName;
	private String videoSavedName;
	private String thumbnailFileName;
	private String thumbnailSavedname;
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public int getMovieType() {
		return movieType;
	}
	public void setMovieType(int movieType) {
		this.movieType = movieType;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public boolean isBlock() {
		return block;
	}
	public void setBlock(boolean block) {
		this.block = block;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public String getVideoSavedName() {
		return videoSavedName;
	}
	public void setVideoSavedName(String videoSavedName) {
		this.videoSavedName = videoSavedName;
	}
	public String getThumbnailFileName() {
		return thumbnailFileName;
	}
	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}
	public String getThumbnailSavedname() {
		return thumbnailSavedname;
	}
	public void setThumbnailSavedname(String thumbnailSavedname) {
		this.thumbnailSavedname = thumbnailSavedname;
	}
	
}
