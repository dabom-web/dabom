package com.dabom.controller;


import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;


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
	public String webtoonRegisterForm(WebtoonBoard webtoonBoard, MultipartFile[] attach, HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<WebtoonBoardAttach> files = new ArrayList<>();
		
		for(MultipartFile uploadFile : attach) {
			String userFileName = uploadFile.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0) {
				WebtoonBoardAttach f = new WebtoonBoardAttach();
				String savedFileName = Util.makeUniqueFileName(userFileName);			
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File savedFile = new File(uploadDir, savedFileName);
					uploadFile.transferTo(savedFile); // 파일 저장
					files.add(f);
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		webtoonBoard.setFiles(files);
		
		return "redirect:webtoonList";
	}
	
}
