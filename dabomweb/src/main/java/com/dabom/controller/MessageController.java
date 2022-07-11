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
	
	@GetMapping(path = { "/message_receive_list" })
	public String messageReceive(String receiver, String sender, Model model) {
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Message> messageList = messageService.findAllMessage(receiver);		
		model.addAttribute("messageList", messageList);
		return "message/message_receive_list";
	}
	
	@GetMapping(path = { "/message_send_list" })
	public String messageSend(String receiver, String sender, Model model) {
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Message> messageList2 = messageService.findAllSendMessage(sender);		
		model.addAttribute("messageList2", messageList2);
		return "message/message_send_list";
	}
	
	@GetMapping(path = { "/message_write" })
	public String messagewriteForm(String receiver, String sender, Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Member> memberList = messageService.findMemberid();		
		model.addAttribute("memberList", memberList);		
		return "message/message_write";
	}

	@PostMapping(path = { "/message_write" })
	public String messagewrite(Message message) {		
		messageService.writeMessage(message);
		return "redirect:message_receive_list"; // 여기 보낸메세지함으로 바꿔
	}
	
	@GetMapping(path = { "/message_receive_detail" })
	public String messageReceiveDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
								Model model) {
		if(messageNo == -1) {
			return "redirect:message_receive_list";
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_receive_list";
		}
		model.addAttribute("message", message);
		
		return "message/message_receive_detail";
	}
	
	@GetMapping(path = { "/message_send_detail" })
	public String messageSendDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
								Model model) {
		if(messageNo == -1) {
			return "redirect:message_send_list";
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_send_list";
		}
		model.addAttribute("message", message);
		
		return "message/message_send_detail";
	}
}
