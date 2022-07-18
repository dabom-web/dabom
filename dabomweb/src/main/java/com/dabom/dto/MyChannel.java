package com.dabom.dto;

import java.util.List;

import lombok.Data;

@Data
public class MyChannel {

	private String member_Id;
	private String channel_Name;
	private String channel_Info;
	private int subscribe;
	private int reg_Date;
	
	private ChannelSubscribe channelSubscribe;
		
	private List<MyChannelProfile> files;
	private List<MyChannelBanner> files2; 
	
	
}
