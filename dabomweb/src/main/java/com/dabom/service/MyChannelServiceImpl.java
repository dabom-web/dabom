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
	
	
	
	
		
	
	
}
