package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "account" })
public class AccountController {
	
	@GetMapping(path = { "/login" })
	public String loginForm() {
		return "account/login";
	}
	
	@GetMapping(path = {"/register"})
	public String registerForm() {
		
		return "account/register";
		
	}

}
