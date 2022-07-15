package com.dabom.mapper;

import java.util.List;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;

public interface MyChannelMapper {

	void insertMyChannel(MyChannel myChannel);

	MyChannel selectMyChannel(String member_Id);

}
