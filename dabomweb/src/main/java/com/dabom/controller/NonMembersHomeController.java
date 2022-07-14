package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NonMembersHomeController {

	@GetMapping(path = { "/nonMembersHome" })
	public String nonMembersHome() {
		return "/nonMembersHome";
	}
	
}
