package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {
	
	@RequestMapping(path = { "/login" })
	public String loginForm() {
		return "account/login";
	}

}
