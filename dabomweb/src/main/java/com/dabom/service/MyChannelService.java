package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;

public interface MyChannelService {

	void createMyChannel(MyChannel myChannel);

	MyChannel findMyChannel(String member_Id);

	void insertChannelSubscribe(String member_Id, String subscriber, int subscribe);

	void subscribeChannel(String member_Id, String subscriber, int subscribe);

	void updateChannelSubscribeCount(String member_Id, int count);

	int findAllSubscribeCount(String member_Id);

	

	
	
	

}
