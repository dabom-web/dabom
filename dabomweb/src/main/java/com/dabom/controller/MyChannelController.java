package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/mychannel" })
public class MyChannelController {
	
	@RequestMapping(path = { "/mychannellist" })
	public String mychanel() {
		return "mychannel/mychannellist";
	}
}
