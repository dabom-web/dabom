package com.dabom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.service.ProduceBoardService;

@Controller
@RequestMapping(path = { "/administerPrivilege" })
public class AcceptController {

	@Autowired
	@Qualifier("produceBoardService")
	private ProduceBoardService produceBoardService;
	
	@GetMapping(path = { "/accept" })
	public String acceptList() {
		
		
		
		return "administerPrivilege/accept";
	}
	
	
}
