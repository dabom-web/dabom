package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.VideoUpload;
import com.dabom.service.VideoUploadService;

@Controller
public class HomeController {
	 
	@Autowired
	@Qualifier("videoUploadService")
	VideoUploadService videoUploadService;
	
	
	@RequestMapping(path = { "/", "home" })
	public String home() {
		return "home";
	}


	@GetMapping(path =  {"/", "home"})
	public String videoList(Model model) {
		List<VideoUpload> videoList = videoUploadService.findHomeList();
	
	model.addAttribute("videoList", videoList);
	
	return "home";
	}

	

}
