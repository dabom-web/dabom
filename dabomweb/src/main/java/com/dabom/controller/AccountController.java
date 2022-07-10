package com.dabom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.Member;
import com.dabom.service.AccountService;

@Controller
@RequestMapping(path = { "account" })
public class AccountController {

	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;
	
	@GetMapping(path = { "/login" })
	public String loginForm() {
		return "account/login";
	}
	
	@PostMapping(path = {"/login"})
	public String login(Member member, HttpSession session) {
		
		Member member2 = accountService.login(member);
		
		if(member2 != null) {
			session.setAttribute("loginuser", member2);
		}else {
			System.out.println("실패용");
		}
		
		return "redirect:/home";
	}
	
	@GetMapping(path = {"/register"})
	public String registerForm() {
		
		return "account/register";
		
	}
	
	@PostMapping(path= {"/register"})
	public String register(Member member) {
		
		accountService.registerMember(member);
		
		return "redirect:login";
	}
	
	@GetMapping(path= {"/logout"})
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return "redirect:/home";
	}

	
}
