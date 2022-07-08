package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.service.VideoUploadService;

@Controller
@RequestMapping(path = { "/video" })
public class VideoUploadController {

	private VideoUploadService videoUploadService;

	@GetMapping(path = { "/uploadList" })
	public String list() {
		return "video/uploadList";

	}

	@GetMapping(path = { "/upload" })
	public String showUploadForm() {

		return "video/upload";

	}

	@PostMapping(path = { "/upload" })
	public String upload() {
		return "redirect:uploadList";

	}

	@GetMapping(path = { "/detail" })
	public String detail() {
		return "video/detail";

	}

	@GetMapping(path = { "/delete" })
	public String delete() {
		return "redirect:uploadList";

	}

	@GetMapping(path = { "/edit" })
	public String showEditForm() {
		return "video/edit";

	}

	@PostMapping(path = { "/edit" })
	public String edit() {
		return "redirect:uploadList";

	}

}
