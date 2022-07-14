package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String sendContactForm(Model model) {
		List<Member> memberList = contactService.findUserMemberList();
		model.addAttribute("memberList", memberList);
		return "/contact-message/sendContact";
	}
	
	@GetMapping(path = { "/sendContactUser" })
	public String sendContactUserForm() {	
		return "/contact-message/sendContactUser";
	}
	
	@GetMapping(path = { "/sendContactList" })
	public String sendContactList(Model model) {		
		List<ContactMessage> contactList = contactService.findAllContactList();
		model.addAttribute("contactList", contactList);
		return "/contact-message/sendContactList";
	}
	
	@PostMapping(path = { "/sendContactAdmin" })
	public String sendContactAdmin(ContactMessage contactMessage) {	
		
		contactService.sendContactAdmin(contactMessage);
		
		return "redirect:/contact-message/sendContactList";
	}
	
	@PostMapping(path = { "/sendContactUser" })
	public String sendContactUser(ContactMessage contactMessage) {	
		
		contactService.sendContactUser(contactMessage);
		
		return "redirect:/contact-message/sendContactUser";
	}
	
	@GetMapping(path = { "/sendContactAdminDetail" })
	public String sendContactDetailForm(Model model,
										@RequestParam(defaultValue = "-1" )int contactNo) {
		
		ContactMessage contactMessage = contactService.findByContactNo(contactNo);
		
		if(contactNo == -1) {
			return "redirect:/contact-message/sendContactList";
		}		
		if (contactMessage == null) {
			return "redirect:/contact-message/sendContactList";
		}
		model.addAttribute("contact",contactMessage);
		return "contact-message/sendContactAdminDetail";
	}
	
	
}
