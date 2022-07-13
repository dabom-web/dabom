package com.dabom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dabom.dto.Member;
import com.dabom.service.ProduceBoardService;

@Controller
public class SidebarController {

	@Autowired
	@Qualifier("produceBoardService")
	private ProduceBoardService produceBoardService;
	
	@GetMapping(path = { "/sidebar/accept-request-count" })
	@ResponseBody
	public String acceptRequestCount(Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginuser");
		
		int count = 0;	
		if( loginUser != null ) {
			count = produceBoardService.findAcceptRequestCount();			
		}
		
		return String.valueOf(count);
	}
}
 