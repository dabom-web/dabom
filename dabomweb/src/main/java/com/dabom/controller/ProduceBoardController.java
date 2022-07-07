package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/produceBoard" })
public class ProduceBoardController {

	@GetMapping(path = { "/directer" })
	public String DirecterInforList() {
		return "produceBoard/directer";
	}
	
	@GetMapping(path = { "/writeDirecterInfor" })
	public String WriteDirecterInfor() {
		return "produceBoard/writeDirecterInfor";
	}
	
}
