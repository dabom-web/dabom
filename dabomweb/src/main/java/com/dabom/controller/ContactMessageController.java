package com.dabom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String contactMessageList(Model model) {
		
		int count = contactService.findReceivedContactMessageCount();
		List<ContactMessage> contactList = contactService.findContactListToAdmin();		
		
		model.addAttribute("contactList", contactList);
		model.addAttribute("count",count);
		
		return "contact-message/contactMessage";
	}
	
	@GetMapping(path = { "/contactMessageToUser" })
	public String contactMessageListToUser(Model model, String memberId) {
		
		List<ContactMessage> contactList = contactService.findContactListToUser(memberId);
		model.addAttribute("contactList", contactList);
		return "contact-message/contactMessageToUser";
	}
	
	@GetMapping(path = { "/sendContact" })
	public String sendContactForm(Model model) {
		
		int count = contactService.findReceivedContactMessageCount();
		List<Member> memberList = contactService.findUserMemberList();
		model.addAttribute("memberList", memberList);
		model.addAttribute("count",count);
		return "contact-message/sendContact";
	}
	
	@GetMapping(path = { "/sendContactUser" })
	public String sendContactUserForm() {	
		return "contact-message/sendContactUser";
	}
	
	@GetMapping(path = { "/sendContactList" })
	public String sendContactList(Model model) {
		int count = contactService.findReceivedContactMessageCount();	
		List<ContactMessage> contactList = contactService.findAllContactList();
		model.addAttribute("contactList", contactList);
		model.addAttribute("count",count);
		return "contact-message/sendContactList";
	}
	
	@GetMapping(path = { "/sendContactListByUser" })
	public String sendContactByUserToAdmin(Model model, String memberId) {
		
		List<ContactMessage> contactList = contactService.findSendContactListByUser(memberId);
		model.addAttribute("contactList", contactList);
		
		return "contact-message/sendContactListByUser";
	}
	
	
	@PostMapping(path = { "/sendContactAdmin" })
	public String sendContactAdmin(ContactMessage contactMessage) {	
		
		contactService.sendContactAdmin(contactMessage);
		
		return "redirect:sendContactList";
	}
	
	@PostMapping(path = { "/sendContactUser" })
	public String sendContactUser(ContactMessage contactMessage) {	
		
		contactService.sendContactUser(contactMessage);
		
		return "redirect:sendContactUser";
	}
	
	@GetMapping(path = { "/sendContactAdminDetail" })
	public String sendContactDetailByAdmin(Model model,
										@RequestParam(defaultValue = "-1" )int contactNo) {
		int count = contactService.findReceivedContactMessageCount();	
		model.addAttribute("count",count);
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
	
	@GetMapping(path = { "/sendContactUserDetail" })
	public String sendContactDetailByUser(Model model,
										@RequestParam(defaultValue = "-1" )int contactNo) {
		
		ContactMessage contactMessage = contactService.findByContactNo(contactNo);
		
		if(contactNo == -1) {
			return "redirect:/contact-message/sendContactListByUser";
		}		
		if (contactMessage == null) {
			return "redirect:/contact-message/sendContactListByUser";
		}
		model.addAttribute("contact",contactMessage);
		return "contact-message/sendContactUserDetail";
	}
	
	@GetMapping(path = { "/receivedContactUserDetail" })
	public String receivedContactDetailToUser(Model model,
											  @RequestParam(defaultValue = "-1" )int contactNo) {
		
		int count = contactService.findReceivedContactMessageCount();	
		model.addAttribute("count",count);
	
		ContactMessage contactMessage = contactService.findByContactNo(contactNo);
		
		if(contactNo == -1) {
			return "redirect:/contact-message/sendContactList";
		}		
		if (contactMessage == null) {
			return "redirect:/contact-message/sendContactList";
		}
		
		model.addAttribute("contact",contactMessage);
		return "contact-message/receivedContactUserDetail";
	}
	
	@GetMapping(path = { "/userReceivedContactDetail" })
	public String userReceivedContactDetail(Model model, String memberId,
											@RequestParam(defaultValue = "-1" )int contactNo) {
		
		ContactMessage contactMessage = contactService.findByContactNoAndMemberId(contactNo, memberId);
		
		if(contactNo == -1) {
			return "redirect:/contact-message/contactMessageToUser";
		}		
		if (contactMessage == null) {
			return "redirect:/contact-message/contactMessageToUser";
		}
		model.addAttribute("contact",contactMessage);
		return "contact-message/userReceivedContactDetail";
	}
	
	@GetMapping(path = { "/replyContact" })
	public String replyContactForm(String memberId, Model model) {
		
		int count = contactService.findReceivedContactMessageCount();	
		model.addAttribute("count",count);
		
		String memberId2 = memberId;
		model.addAttribute("memberId", memberId2);
		
		return "contact-message/replyContact";
	};
	
	
	@PostMapping(path = { "/replyContact" })
	public String sendReplyContact(Model model, ContactMessage contactMessage) {
		
		int count = contactService.findReceivedContactMessageCount();	
		model.addAttribute("count",count);	
		
		contactService.sendReplyContact(contactMessage);
		
		return "redirect:sendContactList";
	}
	
@GetMapping(path = { "/removeChecked" })
public String removeCheckNo(@RequestParam(name = "checkNos", defaultValue = "-1")String checkNos){
	
	String[] checkList = checkNos.split(",");
	for (String checkNo : checkList) {
		contactService.deletedContact(Integer.parseInt(checkNo));
	}
	return "redirect:contactMessage";
}
	

	
}
