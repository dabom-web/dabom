package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/collect" })
public class CollectController {

	@GetMapping(path = { "/chart" })
	public String chartList() {
		return "collect/chart";
	}
	
	@GetMapping(path = { "/hotChannel" })
	public String hotChannelList() {
		return "collect/hotChannel";
	}
	
	@GetMapping(path = { "/newUpdateVideo" })
	public String newUpdateVideoList() {
		return "collect/newUpdateVideo";
	}

	@GetMapping(path = { "/subscribeChannel" })
	public String subscribeChannelList() {
		return "collect/subscribeChannel";
	}
	
	@GetMapping(path = { "/supportActor" })
	public String supprtActorList() {
		return "collect/supportActor";
	}
	
	@GetMapping(path = { "/supportDirector" })
	public String supprtDirectorList() {
		return "collect/supportDirector";
	}
	
	@GetMapping(path = { "/wishList" })
	public String showWishList() {
		return "collect/wishList";
	}
	
}