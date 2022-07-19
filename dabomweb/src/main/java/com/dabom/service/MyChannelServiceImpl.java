package com.dabom.service;

import java.nio.channels.Channel;
import java.util.List;

import com.dabom.dto.ChannelSubscribe;
import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.dto.MyChannel;
import com.dabom.dto.MyChannelBanner;
import com.dabom.dto.MyChannelCommunity;
import com.dabom.dto.MyChannelProfile;
import com.dabom.mapper.MyChannelCommunityMapper;
import com.dabom.mapper.MyChannelMapper;

import lombok.Setter;

public class MyChannelServiceImpl implements MyChannelService {

	@Setter
	private MyChannelMapper myChannelMapper;	
	
	@Override
	public void createMyChannel(MyChannel myChannel) {

		myChannelMapper.insertMyChannel(myChannel);
		
		if(myChannel.getFiles() != null) {
			for(MyChannelProfile file : myChannel.getFiles()) {
				file.setMember_Id(myChannel.getMember_Id());
				myChannelMapper.insertMyChannelProfile(file);
			}
		}
		
	}
		
	@Override
	public MyChannel findMyChannel(String member_Id) {
		
		MyChannel myChannel = myChannelMapper.selectMyChannel(member_Id);
		
		return myChannel;
	}
	
//	@Override
//	public ChannelSubscribe findSubscribe(String member_Id) {
//		
//		ChannelSubscribe channelSubscribe = myChannelMapper.selectSubsribe(member_Id);
//		
//		return channelSubscribe;
//		
//	}
	
	@Override
	public ChannelSubscribe findSubscriber(String memberId) {
		
		ChannelSubscribe channelSubscribe2 = myChannelMapper.selectSubsriber(memberId);
		
		return channelSubscribe2;
		
	}
	
	@Override
	public List<ChannelSubscribe> findSubscribeList(String member_Id) {
		
		List<ChannelSubscribe> channelSubscribeList = myChannelMapper.selectMySubscribeList(member_Id);
		
		return channelSubscribeList;
	}
	
	@Override
	public List<ChannelSubscribe> findSubscribeList2(String member_Id) {
		
		List<ChannelSubscribe> channelSubscribeList2 = myChannelMapper.selectMySubscribeList2(member_Id);
		
		return channelSubscribeList2;
	}
	
	@Override
	public int findSubscribeCount(String member_Id) {
		
		int count = myChannelMapper.selectSubscribeCount2(member_Id);
		
		return count;
	}
	
	@Override
	public MyChannelProfile findMyChannelProfil(String member_Id){
		
		MyChannelProfile myChannelProfile = myChannelMapper.selectMyChannelProfile(member_Id);
		
		return myChannelProfile;
	}
	
	@Override
	public MyChannelBanner findMyChannelBanner(String member_Id) {
		
		MyChannelBanner myChannelBanner = myChannelMapper.selectMyChannelBanner(member_Id);
		
		return myChannelBanner;
	}
	
	@Override
	public void delete(String member_Id) {
		myChannelMapper.deleteMyChannel(member_Id);
	}
	
	@Override
	public void deleteProfile(String member_Id) {
		myChannelMapper.deleteMyChannelProfile(member_Id);	
	}
	
	@Override
	public void dlelteSubcribe(String member_Id) {
		myChannelMapper.deleteSucribe(member_Id);
	}
	
//	@Override
//	public void dlelteSubcribe2(String member_Id) {
//		myChannelMapper.deleteSucribe2(member_Id);
//	}
	
//	@Override
//	public void deleteBanner(String member_Id) {
//		
//		myChannelMapper.deleteMyChannelBanner(member_Id);
//		
//	}

	@Override
	public void insertChannelSubscribe(String member_Id, String subscriber, int subscribe) {
		myChannelMapper.insertChannelSubscribe(member_Id, subscriber, subscribe);
	}
	
	@Override
	public void subscribeChannel(String member_Id, String subscriber) {
		myChannelMapper.deleteChannelSubscribe(member_Id, subscriber);
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

	@Override
	public 	void DirectwriteMessage(Message message) {
		myChannelMapper.insertDirectMessage(message);
	}
		
	@Override
	public ChannelSubscribe findSub(String member_Id, String subscriber) {
		ChannelSubscribe channelSubscribe = myChannelMapper.selectSub(member_Id, subscriber);
		return channelSubscribe;
	}
	
	@Override
	public void uploadBanner(MyChannel myChannel) {
		
		myChannelMapper.updateMyChannel(myChannel);
		
		if(myChannel.getFiles2() != null) {
			for(MyChannelBanner file : myChannel.getFiles2()) {
				file.setMember_Id(myChannel.getMember_Id());
				myChannelMapper.insertMyChannelBanner(file);
			}
		}		
	}


//	@Override
//	public List<Channel> findAllChannelList() {
//		List<Channel> channelList = myChannelMapper.selectAllChannel();
//		return channelList;
//	}


	@Override
	public void updateMyChannelInfo(MyChannel myChannel) {
		myChannelMapper.updateMyChannel(myChannel);
		
	}
	
	@Override
	public void writeCommunity(MyChannelCommunity myChannelCommunity) {
		myChannelMapper.insertCommunity(myChannelCommunity);		
	}

	@Override
	public List<MyChannelCommunity> findCommunity(String member_Id) {
		List<MyChannelCommunity> myChannelCommunity = myChannelMapper.selectCommunity(member_Id);
		return myChannelCommunity;
	}

	@Override
	public void deleteCommunity(int community_No) {
		myChannelMapper.delete(community_No);
	}

	@Override
	public void updateBoardCommunity(MyChannelCommunity myChannelCommunity) {
		myChannelMapper.update(myChannelCommunity);
		
	}

//	@Override
//	public void updateMyChannelInfo(String member_Id) {
//		MyChannel myChannel = myChannelMapper.updateMyChannel2(member_Id);	
//
//		if(myChannel.getFiles() != null) {
//			for(MyChannelProfile file : myChannel.getFiles()) {
//				file.setMember_Id(myChannel.getMember_Id());
//				myChannelMapper.updateMyChannelProfile(file);
//			}
//		}		
//			
//	}
		
	

	
}
