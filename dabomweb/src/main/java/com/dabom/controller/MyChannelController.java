package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping(path = { "/mychannel_main" })
	public String myChannelMain(MyChannel myChannel) {
		
		myChannelService.createMyChannel(myChannel);
		
		return "mychannel/mychannel_main";
	}
	
	@GetMapping(path = { "/mychannel_create" })
	public String myChannelCreateForm() {
				
		return "mychannel/mychannel_create";
	}
	
	@PostMapping(path = { "/mychannel_create" })
	public String myChannelCreate() {
		
		return "mychannel/mychannel_create";
	}
}
