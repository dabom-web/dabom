package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/message" })
public class MessageController {
	
	@RequestMapping(path = { "/messagelist" })
	public String message() {
		return "message/messagelist";
	}

}
