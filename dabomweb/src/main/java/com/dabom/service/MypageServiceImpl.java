package com.dabom.service;

import com.dabom.mapper.ContactMapper;
import com.dabom.mapper.MemberMapper;
import com.dabom.mapper.MessageMapper;
import com.dabom.mapper.MyChannelMapper;
import com.dabom.mapper.MypageMapper;
import com.dabom.mapper.PointPurchaseMapper;
import com.dabom.mapper.ProduceBoardMapper;
import com.dabom.mapper.VideoUploadMapper;
import com.dabom.mapper.WebtoonMapper;

import lombok.Setter;

public class MypageServiceImpl implements MypageService {

	@Setter
	private MemberMapper memberMapper;
	
	@Setter
	private ContactMapper contactMapper;
	
	@Setter
	private MessageMapper messageMapper;
	
	@Setter
	private MyChannelMapper myChannelMapper;
	
	@Setter
	private PointPurchaseMapper pointPurchaseMapper;
	
	@Setter
	private ProduceBoardMapper produceBoardMapper;
	
	@Setter
	private VideoUploadMapper videoUploadMapper;
	
	@Setter
	private WebtoonMapper webtoonMapper;
	
	@Setter
	private MypageMapper mypageMapper;
	
}
