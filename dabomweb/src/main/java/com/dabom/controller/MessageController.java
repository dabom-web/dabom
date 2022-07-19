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
	
	@Qualifier("accountService")
	private AccountService accountService;
	
	@GetMapping(path = { "/message_receive_list" })
	public String messageReceiveList(@RequestParam(defaultValue = "1")int pageNo,
									 String receiver, String sender, Model model) {
				
		int pageSize = 10;
		int pagerSize = 1;
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);		
				
		List<Message> messageList = messageService.findByPageReceiveMessage(receiver, pageNo, pageSize);
		TheMessagePager messagePager = new TheMessagePager(sendCount, pageNo, pageSize, pagerSize, sender, "message_receive_list");
		model.addAttribute("messageList", messageList);
		model.addAttribute("messagePager" ,messagePager);	
		model.addAttribute("pageSize" ,pageSize);
		model.addAttribute("pageNo", pageNo);		
		return "message/message_receive_list";			
	}
	@PostMapping(path = { "/message_receive_list" })
	public String messageReceiveList2() {
		return "message/message_receive_list";	
	}
	
	@GetMapping(path = { "/message_send_list" })
	public String messageSendList(@RequestParam(defaultValue = "1")int pageNo, 
								  String receiver, String sender, Model model) {
		
		int pageSize = 10;
		int pagerSize = 1;
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Message> messageList2 = messageService.findByPageSendMessage(sender, pageNo, pageSize);
		TheMessagePager messagePager = new TheMessagePager(sendCount, pageNo, pageSize, pagerSize, sender, "message_send_list");
		model.addAttribute("messageList2" , messageList2);	
		model.addAttribute("messagePager" ,messagePager);	
		model.addAttribute("pageSize" ,pageSize);
		model.addAttribute("pageNo", pageNo);
		return "message/message_send_list";
	}
	
	@GetMapping(path = { "/message_receive_delete_list" })
	public String messageReceiveDeleteList(@RequestParam(defaultValue = "1")int pageNo,
										   String receiver, String sender, Model model) {
		
		int pageSize = 10;
		int pagerSize = 1;
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		int deleteReceiveCount = 0;
		deleteReceiveCount = messageService.findMessageDeleteReceiveCount(receiver);
		model.addAttribute("deleteReceiveCount",deleteReceiveCount);
			
		List<Message> messageList3 = messageService.findSDeleteReceiveMessage(receiver, pageNo, pageSize);
		TheMessagePager messagePager = new TheMessagePager(deleteReceiveCount, pageNo, pageSize, pagerSize, sender, "message_receive_delete_list");
		model.addAttribute("messageList3" , messageList3);	
		model.addAttribute("messagePager" ,messagePager);	
		model.addAttribute("pageSize" ,pageSize);
		model.addAttribute("pageNo", pageNo);
		return "message/message_receive_delete_list";
	}
	
	@GetMapping(path = { "/message_send_delete_list" })
	public String messageSendDeleteList(@RequestParam(defaultValue = "1")int pageNo,
										String receiver, String sender, Model model) {
		
		int pageSize = 10;
		int pagerSize = 1;
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		int deleteSendCount = 0;
		deleteSendCount = messageService.findMessageDeleteSendCount(sender);
		model.addAttribute("deleteSendCount",deleteSendCount);
			
		List<Message> messageList4 = messageService.findSDeleteSendMessage(sender, pageNo, pageSize);
		TheMessagePager messagePager = new TheMessagePager(deleteSendCount, pageNo, pageSize, pagerSize, sender, "message_send_delete_list");
		model.addAttribute("messageList4", messageList4);	
		model.addAttribute("messagePager" ,messagePager);	
		model.addAttribute("pageSize" ,pageSize);
		model.addAttribute("pageNo", pageNo);		
		return "message/message_send_delete_list";
	}
	
	@GetMapping(path = { "/message_write" })
	public String messagewriteForm(String receiver, String sender, Model model) {
							
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		// 메세지 받을 사람 받아오기
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
		
		if( receiver == null || sender == null) {
			return "redirect:/dabomweb/account/login"; 
		} else {
			messageService.writeMessage(message);
			return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender; 
		}
	}
	@GetMapping(path = { "/message_direct_write" })
	public String messageSenderDirectWriteForm(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo,
												HttpSession session, String receiver, String sender, Model model) {
				
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		List<Member> memberList = messageService.findMemberid();		
		model.addAttribute("memberList", memberList);
				
		if(messageNo == -1) {
			return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender;
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender;
		}
		model.addAttribute("message", message);
		return "message/message_direct_write";		
	}

	@PostMapping(path = { "/message_direct_write" })
	public String messageSenderDirectWrite(Message message, String receiver, String sender, Model model) {	
		
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		
		messageService.DirectwriteMessage(message);
		
		
		return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender;
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
			return "redirect:message_receive_list?receiver=" + receiver + "&sender=" + sender;
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_receive_list?receiver=" + receiver + "&sender=" + sender;
		}
		model.addAttribute("message", message);
		
		return "message/message_receive_detail";
	}
	
	@GetMapping(path = { "/message_receive_delete_detail" })
	public String messageReceiveDeleteDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
									   		String receiver, String sender,Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		int deleteReceiveCount = 0;
		deleteReceiveCount = messageService.findMessageDeleteReceiveCount(receiver);
		model.addAttribute("deleteReceiveCount",deleteReceiveCount);
				
		if(messageNo == -1) {
			return "redirect:/message_receive_delete_detail?receiver=" + receiver + "&sender=" + sender;
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "message/message_receive_delete_list?receiver=" + receiver + "&sender=" + sender;
		}
		model.addAttribute("message", message);		
		return "message/message_receive_delete_detail";
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
			return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender;
		}		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:message_send_list?receiver=" + receiver + "&sender=" + sender;
		}
		model.addAttribute("message", message);
		
		return "message/message_send_detail";
	}
	
	@GetMapping(path = { "/message_send_delete_detail" })
	public String messageSendDeleteDetail(@RequestParam(name="message_no", defaultValue = "-1" )int messageNo, 
									   	  String receiver, String sender ,Model model) {
		int receiveCount = 0;
		receiveCount = messageService.findMessageReceiveCount(receiver);
		model.addAttribute("receiveCount",receiveCount);
		int sendCount = 0;
		sendCount = messageService.findMessageSendCount(sender);
		model.addAttribute("sendCount",sendCount);
		int deleteSendCount = 0;
		deleteSendCount = messageService.findMessageDeleteSendCount(sender);
		model.addAttribute("deleteSendCount",deleteSendCount);
				
		if(messageNo == -1) {
			return "redirect:/message_send_delete_list?receiver=" + receiver + "&sender=" + sender;
		}
		
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) { // 해당 번호의 게시글이 없는 경우
			return "message/message_send_delete_list?receiver=" + receiver + "&sender=" + sender;
		}
		model.addAttribute("message", message);		
		return "message/message_send_delete_detail";
	}
	
	@GetMapping(path= { "/delete" }) 
	public String delete(String receiver, String sender,
						@RequestParam(name = "message_no", defaultValue = "-1") int messageNo)
						/*@RequestParam(defaultValue = "-1") int pageNo)*/ {		
	
	/*if ( messageNo > 0 && pageNo > 0 ) {
		boardService.delete(messageNo);
		return "redirect:list?pageNo="+pageNo;
	}*/
	
	if ( messageNo > 0 ) {
		messageService.delete(messageNo);
		return "redirect:message_receive_delete_list?receiver=" + receiver + "&sender=" + sender;
	}		
		return "message/delete";
	}
		
	
}

