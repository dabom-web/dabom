package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path= {"webtoon"})
public class WebtoonController {

	
	
	@GetMapping(path= {"/webtoonList"})
	public String webtoonList() {
		
		return "webtoon/webtoonList";
		
	}
	
	@GetMapping(path= {"/webtoonRegister"})
	public String webtoonRegister() {
		
		return "webtoon/webtoonRegister";
		
	}
	
	@PostMapping(path= {"/webtoonRegister"})
		public String webtoonRegisterForm() {
		
		return null;
	}
	
}
