package com.dabom.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.service.WebtoonService;
import com.dabom.ui.ThePager;


@Controller
@RequestMapping(path= {"webtoon"})
public class WebtoonController {
	
	@Autowired
	@Qualifier("webtoonService")
	WebtoonService webtoonservice;
	
	@GetMapping(path= {"/webtoonList"})
	public String webtoonList(@RequestParam(defaultValue ="1")int pageNo ,Model model) {
		
		int pageSize = 9; 
		int pagerSize = 3;
		int count = 0; // 전체 데이터 개수
		
		//List<WebtoonBoard> boardList = webtoonservice.findAll();
		
		  List<WebtoonBoard> boardList = webtoonservice.findByPage(pageNo, pageSize); 
		  count = webtoonservice.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회
		  
		  ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");
		 
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
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
		webtoonservice.writeWebtoonBoard(webtoonBoard);
		
		return "redirect:webtoonList";
	}
	
}
