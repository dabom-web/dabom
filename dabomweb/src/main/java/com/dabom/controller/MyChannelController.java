package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.service.MyChannelService;

@Controller
@RequestMapping(path = { "/mychannel" })
public class MyChannelController {
	
	@Autowired
	@Qualifier("myChannelService")
	private MyChannelService myChannelService;
	
	@GetMapping(path = { "/mychannel_main" })
	public String myChannelMainForm(String member_Id, Model model) {		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
		model.addAttribute("myChannel", myChannel);		
		
		return "mychannel/mychannel_main"; 		
	
	}
	
	@GetMapping(path = { "/mychannel_create" })
	public String myChannelCreateForm() {
				
		return "mychannel/mychannel_create";
	}
	
	
	@PostMapping(path = { "/mychannel_create" })
	public String myChannelCreate(MyChannel myChannel, String member_Id) {
		
		myChannelService.createMyChannel(myChannel);		
		
		return "redirect:mychannel_main?member_Id=" + member_Id;
	}
	
	@GetMapping(path = { "/mychannel" })
	public String myChannel(String member_Id, Model model) {
		
		MyChannel myChannel = myChannelService.findMyChannel(member_Id);
		model.addAttribute("myChannel", myChannel);
		
		return "mychannel/mychannel";
	}
	
	
	
//	@PostMapping(path = { "/mychannel_main" }, produces = {"application/json;charset=utf-8"})
//    @ResponseBody
//    public String subscribeChannel(String member_Id, String subscriber, int subscribe, Boolean isNew) {
//    	
//		if (isNew == true) {
//			myChannelService.insertChannelSubscribe(member_Id, subscriber, subscribe);
//		} else {
//			myChannelService.subscribeChannel(member_Id, subscriber, subscribe);
//		}
//		
//		myChannelService.updateChannelSubscribeCount(member_Id , subscribe == 1 ? 1 : -1);
//		int count = myChannelService.findAllSubscribeCount(member_Id);
//		
//		return String.format("{ \"result\" : \"success\", \"count\" : %d }", count);
//    }
//    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
