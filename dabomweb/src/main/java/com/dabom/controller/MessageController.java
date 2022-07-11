package com.dabom.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.service.MessageService;

@Controller
@RequestMapping(path = { "/message" })
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;
	
	@GetMapping(path = { "/messagelist" })
	public String message(Model model) {
		
		int count = 0;
		count = messageService.findMessageCount();
		model.addAttribute("count",count);
		
		List<Message> messageList = messageService.findAllMessage();		
		model.addAttribute("messageList", messageList);
		return "message/messagelist";
	}
	
	@GetMapping(path = { "/messagewrite" })
	public String messagewriteForm(Model model) {
		int count = 0;
		count = messageService.findMessageCount();
		model.addAttribute("count",count);
		
		List<Member> memberList = messageService.findMemberid();
		model.addAttribute("memberList", memberList);
		return "message/messagewrite";
	}

	@PostMapping(path = { "/messagewrite" })
	public String messagewrite(Message message) {		
		messageService.writeMessage(message);
		return "redirect:messagelist";
	}
	
	@GetMapping(path = { "/messagedetail" })
	public String messageDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
								Model model) {
		if(messageNo == -1) {
			return "redirect:messagelist";
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:messagelist";
		}
		model.addAttribute("message", message);
		
		return "message/messagedetail";
	}
}
