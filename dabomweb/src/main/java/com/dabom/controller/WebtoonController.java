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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.WebtoonBoard;
import com.dabom.dto.WebtoonBoardAttach;
import com.dabom.dto.WebtoonListByTitleComment;
import com.dabom.dto.WebtoonListByTitle;
import com.dabom.dto.WebtoonListByTitleAttach;
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
		  
		  ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "webtoonList");
		 
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "webtoon/webtoonList";
		
	}
	
	@GetMapping(path= {"/webtoonRegister"})
	public String webtoonRegisterForm() {
		
		return "webtoon/webtoonRegister";
		
	}
	
	@PostMapping(path= {"/webtoonRegister"})
	public String webtoonRegister(WebtoonBoard webtoonBoard, MultipartFile[] attach, HttpServletRequest req) {
		
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
	
	@GetMapping(path= {"/webtoonListByTitle"})
	public String webtoonListbyTitle (@RequestParam(name="boardno", defaultValue="-1")int boardNo,
									  @RequestParam(name="pageNo", defaultValue="-1")int pageNo,
									  Model model) {
		
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:webtoonList";
		}
		
		WebtoonBoard webtoonBoard = webtoonservice.findByBoardNo(boardNo);
		if(webtoonBoard == null) {
			return"redirect:webtoonList";
		}
		
		List<WebtoonListByTitle> webtoonListByTitle = webtoonservice.webtoonByTitlefindAll(boardNo);
		
		
		model.addAttribute("webtoonBoard", webtoonBoard);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("webtoonListByTitle",webtoonListByTitle);
		
		return "webtoon/webtoonListByTitle";
		
	}
	
	@GetMapping(path= {"/webtoonListByTitleRegister"})
	public String webtoonListByTitleRegisterForm() {
		
		return"webtoon/webtoonListByTitleRegister";
		
	}
	
	@PostMapping(path= {"/webtoonListByTitleRegister"})
	public String registerWebtoonListByTitle(WebtoonListByTitle webtoonListByTitle,												
												 @RequestParam(name="pageNo", defaultValue="-1")int pageNo,
												 MultipartFile[] attach, HttpServletRequest req) {
		
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<WebtoonListByTitleAttach> files = new ArrayList<>();
		
		for(MultipartFile uploadFile : attach) {
			String userFileName = uploadFile.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0) {
				WebtoonListByTitleAttach f = new WebtoonListByTitleAttach();
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
		
		//webtoonListByTitle.setBoardNo(webtoonListByTitle.getBoardNo());
		webtoonListByTitle.setFiles(files);
		webtoonservice.writeWebtoonBoardByTitle(webtoonListByTitle);
		
		
		return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", webtoonListByTitle.getBoardNo(), pageNo);
		
	}
	
	@GetMapping(path= {"/detail"})
	public String detail( int number,
			 @RequestParam(name="pageNo", defaultValue="-1")int pageNo,
			Model model) {
		
		WebtoonListByTitle webtoonListByTitle = webtoonservice.findByNumber(number);
		
		List<WebtoonListByTitleAttach> webtoonListByTitleattach = webtoonservice.webtoonByTitlefindAttach(number);

		model.addAttribute("webtoonListByTitle", webtoonListByTitle);
		model.addAttribute("webtoonListByTitleattach",webtoonListByTitleattach);
		
		return "webtoon/detail";
		
	}
	
	@GetMapping(path= {"/delete"})
	public String delete(@RequestParam(name="boardno", defaultValue="-1") int boardNo,
						 @RequestParam(name="number", defaultValue="-1") int number,
						 @RequestParam(name="pageNo", defaultValue="-1")int pageNo,
						  Model model) {
	
		if(boardNo>0  && number > 0) {
			webtoonservice.delete(number);
			//webtoonservice.deleteAttach(number);
			return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", boardNo,pageNo) ;
		}
			return "redirect:webtoonListByTitle";	
	}
	@GetMapping(path= {"/edit"})
	public String editForm(@RequestParam(name="boardno", defaultValue = "-1")int boardNo,
						   @RequestParam(name="number", defaultValue = "-1")int number,
						   @RequestParam(name="pageNo", defaultValue = "-1")int pageNo, Model model) {
		if(number < 1 && pageNo < 1) {
			return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", boardNo,pageNo);
		}
		
		WebtoonListByTitle webtoonListByTitle = webtoonservice.findByNumber(number);
		 List<WebtoonListByTitleAttach> attach = webtoonservice.webtoonByTitlefindAttach(number);
		 int thumbnailAttachNo = attach.get(0).getAttachNo();
		 int webtoonAttachNo = attach.get(1).getAttachNo();
		if(webtoonListByTitle == null) {
			return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", boardNo,pageNo);
		}
		
		model.addAttribute("webtoonListByTitle",webtoonListByTitle);
		model.addAttribute("thumbnailAttachNo",thumbnailAttachNo);
		model.addAttribute("webtoonAttachNo",webtoonAttachNo);
		 return "webtoon/edit";
	}
	
	@PostMapping(path= {"/edit"})
	public String edit(WebtoonListByTitle webtoonListByTitle, 
					   @RequestParam(name="pageNo", defaultValue = "-1")int pageNo,
					   @RequestParam(name="boardNo", defaultValue = "-1")int boardNo,
					   @RequestParam(name="thumbnailAttachNo", defaultValue = "-1")int thumbnailAttachNo,
					   @RequestParam(name="webtoonAttachNo", defaultValue = "-1")int webtoonAttachNo,
					   MultipartFile[] attach, HttpServletRequest req) {
		if(pageNo < 1) {
			return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", boardNo,pageNo);
		}
		
		webtoonservice.update(webtoonListByTitle);
		
		//첨부파일 가져오기
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
				
				ArrayList<WebtoonListByTitleAttach> files = new ArrayList<>();
				
				for(MultipartFile uploadFile : attach) {
					String userFileName = uploadFile.getOriginalFilename();
					if(userFileName != null && userFileName.length() > 0) {
						WebtoonListByTitleAttach f = new WebtoonListByTitleAttach();
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
		
		//webtoonListByTitle.setBoardNo(webtoonListByTitle.getBoardNo());
		//webtoonListByTitle.setFiles(files);
		files.get(0).setAttachNo(thumbnailAttachNo);
		files.get(1).setAttachNo(webtoonAttachNo);
		webtoonservice.updateWebtoonBoardByTitle(files);
		
		
		return String.format("redirect:webtoonListByTitle?boardno=%d&pageNo=%d", boardNo,pageNo);
		
	}
	
	////////////////////////////////////////////
	
	@PostMapping(path = { "/comment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String writeComment(WebtoonListByTitleComment webtoonComment) {
		
		webtoonservice.writeWebtoonComment(webtoonComment);
		
		return "success";
		
	}
	
	@GetMapping(path = { "/comment-list" })
	public String listComment(@RequestParam(name="number") int number, Model model) {
		
		List<WebtoonListByTitleComment> comments = webtoonservice.findCommentsByNumber(number);
		
		model.addAttribute("comments", comments);
		
		return "board/comments";
		
	}
	
}
