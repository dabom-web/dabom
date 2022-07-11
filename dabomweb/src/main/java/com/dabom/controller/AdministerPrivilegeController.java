package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/list" })
public class AdministerPrivilegeController {

	@GetMapping()
	public String list() {
		return "AdministerPrivilege/list";

	}

	@PostMapping(path = { "/release" })
	public boolean release() {
		return false;

	}
}
