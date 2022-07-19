package com.dabom.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.Member;
import com.dabom.dto.MyChannel;
import com.dabom.service.AccountService;
import com.dabom.service.MyChannelService;

@Controller
@RequestMapping(path = {"/administerPrivilege"})
public class AdministerPrivilegeController {

	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;
	
	@Autowired
	@Qualifier("myChannelService")
	private MyChannelService myChannelService;	
	
	@GetMapping(path = { "/list" })
	public String list() {
		return "administerPrivilege/list";

	}

	@PostMapping(path = { "/release" })
	public boolean release() {
		return false;

	}
	
	@GetMapping(path = { "/site-revenue" })
	public String siteRevenue() {
		return "administerPrivilege/site-revenue";

	}
	
	@GetMapping(path = { "/member-management"})
	public String userManagement(Model model) {
		
		List<Member> memberList = accountService.findAllMember();
		model.addAttribute("memberList", memberList);
		
		
		return "administerPrivilege/member-management";
	}
		
	@GetMapping(path = { "/channel-management"})
	public String channelManagement(Model model) {
		
		List<MyChannel> channelList = myChannelService.findAllChannelList();
		model.addAttribute("channelList", channelList);
		return "administerPrivilege/channel-management";
	}
	
	@GetMapping(path = { "/board-and-comment-management"})
	public String boardAndCommentManagement() {
		return "administerPrivilege/board-and-comment-management";
	}
	
	
}
