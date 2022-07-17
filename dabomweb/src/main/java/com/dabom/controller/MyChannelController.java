package com.dabom.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.ChannelSubscribe;
import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.dto.MyChannel;
import com.dabom.dto.MyChannelBanner;
import com.dabom.dto.MyChannelProfile;
import com.dabom.dto.WebtoonListByTitleAttach;
import com.dabom.service.MessageService;
import com.dabom.service.MyChannelService;
import com.mysql.cj.Session;

@Controller
@RequestMapping(path = { "/mychannel" })
public class MyChannelController {
	
	@Autowired
	@Qualifier("myChannelService")
	private MyChannelService myChannelService;	
	
	@Qualifier("messageService")
	private MessageService messageService;
	
	@GetMapping(path = { "/mychannel" })
	public String myChannelForm(String member_Id, Model model, HttpSession session) {
		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
//		ChannelSubscribe channelSubscribe = myChannelService.findSubscribe(member_Id);		
		List<ChannelSubscribe> channelSubscribeList = myChannelService.findSubscribeList(member_Id);
		List<ChannelSubscribe> channelSubscribeList2 = myChannelService.findSubscribeList2(member_Id);
		MyChannelProfile myChannelProfile = myChannelService.findMyChannelProfil(member_Id);
//		MyChannelBanner myChannelBanner = myChannelService.findMyChannelBanner(member_Id);
		int subCount = myChannelService.findSubscribeCount(member_Id);
//		ChannelSubscribe channelSubscribe = myChannelService.findSub(member_Id, loginUser.getMemberId());
		
		model.addAttribute("myChannel", myChannel);
//		model.addAttribute("channelSubscribe", channelSubscribe);		
		model.addAttribute("channelSubscribeList", channelSubscribeList);
		model.addAttribute("channelSubscribeList2", channelSubscribeList2);
		model.addAttribute("myChannelProfile", myChannelProfile);
//		model.addAttribute("myChannelBanner", myChannelBanner);
		model.addAttribute("subCount", subCount);
		
		
		return "mychannel/mychannel"; 	
	
	}
	
	@GetMapping(path = { "/channel" })
	public String ChannelForm(String member_Id, String subscriber, Model model, HttpSession session) {
		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);		
		MyChannelProfile myChannelProfile = myChannelService.findMyChannelProfil(member_Id);
		ChannelSubscribe channelSubscribe = myChannelService.findSub(member_Id, subscriber);
		
		
		model.addAttribute("myChannel", myChannel);
		model.addAttribute("myChannelProfile", myChannelProfile);
		model.addAttribute("channelSubscribe", channelSubscribe);
		
		return "mychannel/channel"; 	
	}
	
	@GetMapping(path = { "/mychannel_create" })
	public String myChannelCreateForm() {
				
		return "mychannel/mychannel_create";
	}
	
	
	@PostMapping(path = { "/mychannel_create" })
	public String myChannelCreate(MyChannel myChannel, String member_Id, 
								  MultipartFile[] attach, HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");		
		ArrayList<MyChannelProfile> files = new ArrayList<>();
		
		for(MultipartFile uploadFile : attach) {
			String userFileName = uploadFile.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0) {
				MyChannelProfile f = new MyChannelProfile();
				String savedFileName = Util.makeUniqueFileName(userFileName);			
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File savedFile = new File(uploadDir, savedFileName);
					uploadFile.transferTo(savedFile); // 파일 저장
					files.add(f);
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		myChannel.setFiles(files);		
		myChannelService.createMyChannel(myChannel);		
		
		return ("redirect:mychannel?member_Id=" + member_Id);
	}
	
	@GetMapping(path = { "/mychannel_create_banner" })
	public String myChannelCreateForm(String member_Id, Model model){		
		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
		model.addAttribute("myChannel", myChannel);
		
		return "mychannel/mychannel_create_banner";
	}
	
	@PostMapping(path = { "/mychannel_create_banner" })
	public String myChannelCreateBanner(MyChannel myChannel, String member_Id, 
			  					  	MultipartFile[] attach, HttpServletRequest req){
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		ArrayList<MyChannelBanner> files2 = new ArrayList<>();
		
		for(MultipartFile uploadFile : attach) {
			String userFileName = uploadFile.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0) {
				MyChannelBanner f = new MyChannelBanner();
				String savedFileName = Util.makeUniqueFileName(userFileName);			
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File savedFile = new File(uploadDir, savedFileName);
					uploadFile.transferTo(savedFile); // 파일 저장
					files2.add(f);
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		myChannel.setFiles2(files2);
		
		return ("redirect:mychannel?member_Id=" + member_Id);
	}
	
	@GetMapping(path = { "/mychannel_update" })
	public String myChannelUpdateForm(String member_Id, Model model) {		
		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
		model.addAttribute("myChannel", myChannel);
		
		return "mychannel/mychannel_update";
	}
	
	@PostMapping(path = { "/mychannel_update" })
	public String myChannelUpdate(MyChannel myChannel, String member_Id, 
								MultipartFile[] attach, HttpServletRequest req) {
		myChannelService.deleteProfile(member_Id);
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");		
		ArrayList<MyChannelProfile> files = new ArrayList<>();
		
		for(MultipartFile uploadFile : attach) {
			String userFileName = uploadFile.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0) {
				MyChannelProfile f = new MyChannelProfile();
				String savedFileName = Util.makeUniqueFileName(userFileName);			
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File savedFile = new File(uploadDir, savedFileName);
					uploadFile.transferTo(savedFile); // 파일 저장
					files.add(f);
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		myChannel.setFiles(files);	
		myChannelService.updateMyChannelInfo(myChannel);
		
		return "redirect:mychannel?member_Id=" + member_Id;
	}
	
	@GetMapping(path= { "/delete" }) 
	public String delete(String member_Id) {
		
		myChannelService.delete(member_Id);
		myChannelService.deleteProfile(member_Id);
		myChannelService.dlelteSubcribe(member_Id);
//		myChannelService.dlelteSubcribe2(member_Id);
//		myChannelService.deleteBanner(member_Id);
		
		return "redirect:/home";
		
	}
	
	@PostMapping(path = { "/channel" }, produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String subscribeChannel(String member_Id, String subscriber, int subscribe, Boolean isNew) {
    	
		if (isNew == true) {
			myChannelService.insertChannelSubscribe(member_Id, subscriber, subscribe);
		} else {
			myChannelService.subscribeChannel(member_Id, subscriber);
		}
		
		myChannelService.updateChannelSubscribeCount(member_Id , subscribe == 1 ? 1 : -1);
		int count = myChannelService.findAllSubscribeCount(member_Id);
		
		return String.format("{ \"result\" : \"success\", \"count\" : %d }", count);
    }
    
	@GetMapping(path = { "/message_direct" })
	public String messageSenderDirectWriteForm(String member_Id, HttpSession session, Model model) {
					
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
		model.addAttribute("myChannel", myChannel);
		
		return "mychannel/message_direct";		
	}

	@PostMapping(path = { "/message_direct" })
	public String messageSenderDirectWrite(Message message, HttpSession session) {			
		
		Member loginUser = (Member)session.getAttribute("loginuser");
		myChannelService.DirectwriteMessage(message);		
		
		return "redirect:/message/message_send_list?sender="+ loginUser.getMemberId();
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
