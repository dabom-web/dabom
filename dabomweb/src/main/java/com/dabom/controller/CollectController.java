package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dabom.dto.VideoUpload;
import com.dabom.service.VideoUploadService;
import com.dabom.ui.ThePager;

@Controller
@RequestMapping(path = { "/collect" })
public class CollectController {	
	
	@Autowired	
	@Qualifier("videoUploadService")
	private VideoUploadService videoUploadService;
	
	@GetMapping(path = { "/chart" })
	public String chartList() {
		return "collect/chart";
	}
	
	@GetMapping(path = { "/hotChannel" })
	public String hotChannelList(String memberId, Model model,
								@RequestParam(defaultValue = "1") int pageNo) {
		
		int pageSize = 30;
		int pagerSize = 10;
		int count = 0;
		
		List<VideoUpload> videoList = videoUploadService.findHomeList();

		List<VideoUpload> vList = videoUploadService.findByPage(pageNo, pageSize);

		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, memberId);
		
		model.addAttribute("vList", videoList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		return "collect/hotChannel";
	}
	
	@GetMapping(path = { "/newUpdateVideo" })
	public String newUpdateVideoList(String memberId, Model model) {

		List<VideoUpload> videoList = videoUploadService.findNewUploadList();
		model.addAttribute("vList", videoList);
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