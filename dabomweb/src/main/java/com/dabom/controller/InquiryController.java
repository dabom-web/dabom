package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/inquiry" })
public class InquiryController {

	@GetMapping(path = { "/inquiry " })
	public String inquiryListForm() {
		
		return "inquiry/inquiry";
	}
	
}
