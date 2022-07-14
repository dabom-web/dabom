package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/mychannel" })
public class MyChannelController {
	
	@GetMapping(path = { "/mychannel_main" })
	public String myChannelMain() {
		return "mychannel/mychannel_main";
	}
	
	@GetMapping(path = { "/mychannel_create" })
	public String myChannelForm() {
		
		return "mychannel/mychannel_create";
	}
}
