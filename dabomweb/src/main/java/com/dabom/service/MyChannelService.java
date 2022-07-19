package com.dabom.service;

import java.util.List;

import com.dabom.dto.ChannelSubscribe;
import com.dabom.dto.Message;
import com.dabom.dto.MyChannel;
import com.dabom.dto.MyChannelBanner;
import com.dabom.dto.MyChannelCommunity;
import com.dabom.dto.MyChannelProfile;
import com.dabom.dto.VideoUpload;

public interface MyChannelService {

	void createMyChannel(MyChannel myChannel);
	
	MyChannel findMyChannel(String member_Id);
//	ChannelSubscribe findSubscribe(String member_Id);
	ChannelSubscribe findSubscriber(String memberId);
	List<ChannelSubscribe> findSubscribeList(String member_Id);
	List<ChannelSubscribe> findSubscribeList2(String member_Id);
	int findSubscribeCount(String member_Id);
	
	
	void insertChannelSubscribe(String member_Id, String subscriber, int subscribe);

	void subscribeChannel(String member_Id, String subscriber);

	void updateChannelSubscribeCount(String member_Id, int count);

	int findAllSubscribeCount(String member_Id);

	void updateMyChannelInfo(MyChannel myChannel);

	MyChannelProfile findMyChannelProfil(String member_Id);

//	MyChannelBanner findMyChannelBanner(String member_Id);

	void delete(String member_Id);
	void deleteProfile(String member_Id);
	void dlelteSubcribe(String member_Id);
//	void dlelteSubcribe2(String member_Id);
//	void deleteBanner(String member_Id);

	void DirectwriteMessage(Message message);

	ChannelSubscribe findSub(String member_Id, String subscriber);

	List<MyChannel> findAllChannelList();

	void uploadBanner(MyChannel myChannel);

	MyChannelBanner findMyChannelBanner(String member_Id);

	void writeCommunity(MyChannelCommunity myChannelCommunity);

	List<MyChannelCommunity> findCommunity(String member_Id);

	void deleteCommunity(int communityNo);

	void updateBoardCommunity(MyChannelCommunity myChannelCommunity);

	int findMyUloadCount(String member_Id);

	

	



	


	

	

	

	

	

	

	
	


	

}
