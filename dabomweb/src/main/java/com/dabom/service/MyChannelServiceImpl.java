package com.dabom.service;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.mapper.MyChannelMapper;

import lombok.Setter;

public class MyChannelServiceImpl implements MyChannelService {

	@Setter
	private MyChannelMapper myChannelMapper;

	@Override
	public void createMyChannel(MyChannel myChannel) {

		myChannelMapper.insertMyChannel(myChannel);
		
	}
	
	@Override
	public MyChannel findMyChannel(String member_Id) {
		
		MyChannel myChannel = myChannelMapper.selectMyChannel(member_Id);
		
		return myChannel;
	}
	
	@Override
	public void insertChannelSubscribe(String member_Id, String subscriber, int subscribe) {
		myChannelMapper.insertChannelSubscribe(member_Id, subscriber, subscribe);
	}
	
	@Override
	public void subscribeChannel(String member_Id, String subscriber, int subscribe) {
		myChannelMapper.updateChannelSubscribe(member_Id, subscriber, subscribe);
	}
	
	@Override
	public void updateChannelSubscribeCount(String member_Id, int count) {
		myChannelMapper.updateChannelSubscribeCount(member_Id, count);
	}

	@Override
	public int findAllSubscribeCount(String member_Id) {
		int count = myChannelMapper.selectSubscribeCount(member_Id);
		return count;
	}
	
		
	
	
}
