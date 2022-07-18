package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/administerPrivilege"})
public class AdministerPrivilegeController {

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
	
}
