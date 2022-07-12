package com.dabom.controller;

import java.util.ArrayList;
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

import com.dabom.dto.Member;
import com.dabom.dto.Message;
import com.dabom.service.AccountService;
import com.dabom.service.MessageService;
import com.dabom.ui.TheMessagePager;

@Controller
@RequestMapping(path = { "/message" })
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;
	
	@GetMapping(path = { "/message_receive_list" })
	public String messageReceiveList(String receiver, String sender, Model model) {
				
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
	public String messageSendList(String receiver, String sender, Model model) {
		
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
	
//	@GetMapping(path = { "/message_send_list" })
//	public String messageSendList( @RequestParam(defaultValue = "1")int pageNo, 
//								  String receiver, String sender, Model model) {
//		
//		int pageSize = 10;
//		int pagerSize = 1;
//		int receiveCount = 0;
//		receiveCount = messageService.findMessageReceiveCount(receiver);
//		model.addAttribute("receiveCount",receiveCount);
//		int sendCount = 0;
//		sendCount = messageService.findMessageSendCount(sender);
//		model.addAttribute("sendCount",sendCount);
//		
//		List<Message> messageList2 = messageService.findAllSendMessage(sender, pageNo, pageSize);		
//		TheMessagePager messagePager = new TheMessagePager(sendCount, pageNo, pageSize, pagerSize, sender, "message_send_list");
//		model.addAttribute("messageList2" , messageList2);	
//		model.addAttribute("messagePager" ,messagePager);
//		model.addAttribute("pageSize" ,pageSize);
//		model.addAttribute("pageNo", pageNo);
//		return "message/message_send_list";
//	}
	
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
	public String messageWrite(Message message, String receiver, String sender,Model model) {	
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		messageService.writeMessage(message);
		return "redirect:message_send_list"; 
	}
	@GetMapping(path = { "/message_sender_direct_write" })
	public String messageSenderDirectWriteForm(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo,
													   String receiver, String sender, Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Member> memberList = messageService.findMemberid();		
		model.addAttribute("memberList", memberList);
		
		if(messageNo == -1) {
			return "redirect:message_receive_list";
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_receive_list";
		}
		model.addAttribute("message", message);
		return "message/message_sender_direct_write";
	}

	@PostMapping(path = { "/message_sender_direct_write" })
	public String messageSenderDirectWrite(Message message, String receiver, String sender, Model model) {	
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		messageService.DirectwriteMessage(message);
		
		
		return "redirect:message_send_list"; 
	}
	
	@GetMapping(path = { "/message_receiver_direct_write" })
	public String messageReceiverDirectWriteForm(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo,
			   String receiver, String sender, Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Member> memberList = messageService.findMemberid();		
		model.addAttribute("memberList", memberList);
		
		if(messageNo == -1) {
		return "redirect:message_receive_list";
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
		return "redirect:message_receive_list";
		}
		model.addAttribute("message", message);
		return "message/message_receiver_direct_write";
	}
	
	@PostMapping(path = { "/message_receiver_direct_write" })
	public String messageReceiverDirectWrite(Message message, String receiver, String sender, Model model) {	
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		messageService.DirectwriteMessage(message);
		
		
		return "redirect:message_send_list"; 
	}
	
	@GetMapping(path = { "/message_receive_detail" })
	public String messageReceiveDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
									   String receiver, String sender,Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
				
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
									String receiver, String sender, Model model) {
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
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
