package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.ContactMessage;
import com.dabom.dto.Member;
import com.dabom.service.AccountService;
import com.dabom.service.ContactService;



@Controller
@RequestMapping(path = { "/contact-message" })
public class ContactMessageController {
	
	@Autowired
	@Qualifier("contactService")
	private ContactService contactService;
	
	@Qualifier("accountService")
	private AccountService accountService;
	
	@GetMapping(path = { "/contactMessage" })
	public String contactMessageList() {
		return "/contact-message/contactMessage";
	}
	
	@GetMapping(path = { "/sendContact" })
	public String sendContactForm() {
		return "/contact-message/sendContact";
	}
	
	@GetMapping(path = { "/sendContactList" })
	public String sendContactList() {
		return "/contact-message/sendContactList";
	}
	
	@PostMapping(path = { "/sendContactAdmin" })
	public String sendContactAdmin(ContactMessage contactMessage,
								   Model model) {	
		
		List<Member> memberList = contactService.findUserMemberList();
		model.addAttribute("memberList", memberList);
		
		contactService.sendContactAdmin(contactMessage);
		
		
		return "redirect:/contact-message/sendContactList";
	}
}
