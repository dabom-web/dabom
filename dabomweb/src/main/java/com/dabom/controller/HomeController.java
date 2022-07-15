package com.dabom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.service.ContactService;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("contactService")
	private ContactService contactService;
	
	@RequestMapping(path = { "/", "home" })
	public String home() {
		return "home";
	}

	@GetMapping(path = { "/", "home" })
	public String loginMemberId(HttpSession session, Model model) {
		
		String memberId = session.getId();
		int count = contactService.newReceivedMessage(memberId);
		model.addAttribute("count", count);
		return "home";
	}
	
	@GetMapping(path = { "/modules/header" })
	public String memberId(HttpSession session, Model model) {
		
		String memberId = session.getId();
		int count = contactService.newReceivedMessage(memberId);
		model.addAttribute("count", count);
		return "modules/header";
	}
	
}
