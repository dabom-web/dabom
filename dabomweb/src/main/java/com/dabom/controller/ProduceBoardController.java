package com.dabom.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.dabom.dto.Member;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProduceSupport;
import com.dabom.dto.ProducerAttach;
import com.dabom.service.AccountService;
import com.dabom.service.ProduceBoardService;



@Controller
@RequestMapping(path = { "/produceBoard" })
public class ProduceBoardController {

	
	@Autowired
	@Qualifier("produceBoardService")
	private ProduceBoardService produceBoardService;
	
	@GetMapping(path = { "/director" })
	public String directorInforList(Model model) {
	
		List<ProduceBoard> directorList = produceBoardService.findDirectorList();
		model.addAttribute("directorList", directorList);
		return "produceBoard/director";
	}
	
	@GetMapping(path = { "/writeDirectorInfor" })
	public String writeDirectorInforForm() {
		return "produceBoard/writeDirectorInfor";
	}
	
	@PostMapping(path = { "/writeDirectorInfor" })
	public String writeDirectorInfor(ProduceBoard produceBoard,
									 MultipartFile[] producerAttach,
									 HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		ArrayList<ProducerAttach> files = new ArrayList<>();
		for (MultipartFile file : producerAttach) {
			String userFileName = file.getOriginalFilename();
			if (userFileName != null && userFileName.length() > 0) {
				ProducerAttach f = new ProducerAttach();
				String savedFileName = Util.makeUniqueFileName(userFileName);
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File path = new File(uploadDir, savedFileName);
					file.transferTo(path); // 파일 저장
					files.add(f);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		produceBoard.setFiles(files);
		produceBoardService.writeInfor(produceBoard);
		return "redirect:/produceBoard/director";
	}
	
	@GetMapping(path = { "/actor" })
	public String actorInforList(Model model) {
		List<ProduceBoard> actorList = produceBoardService.findActorList();
		model.addAttribute("actorList",actorList);
		return "produceBoard/actor";
	}
	
	@GetMapping(path = { "/writeActorInfor" })
	public String writeActorInforForm() {
		return "produceBoard/writeActorInfor";
	}
	
	@PostMapping(path = { "/writeActorInfor" })
	public String writeActorInfor(ProduceBoard produceBoard,
								  MultipartFile[] producerAttach,
								  HttpServletRequest req,
								  Model model) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		ArrayList<ProducerAttach> files = new ArrayList<>();
		for (MultipartFile file : producerAttach) {
			String userFileName = file.getOriginalFilename();
			if (userFileName != null && userFileName.length() > 0) {
				ProducerAttach f = new ProducerAttach();
				String savedFileName = Util.makeUniqueFileName(userFileName);
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File path = new File(uploadDir, savedFileName);
					file.transferTo(path); // 파일 저장
					files.add(f);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		produceBoard.setFiles(files);
		try {
			produceBoardService.writeInfor(produceBoard);
		} catch (Exception ex) {
			model.addAttribute("error", "파일형식오류");
			return "produceBoard/writeActorInfor";
		}
		return "redirect:/produceBoard/actor";
		
	}
	
	@GetMapping(path = { "/directorDetail" })
	public String produceDirectorDetailForm(@RequestParam(name="boardno", defaultValue = "-1")int boardNo,
											 HttpSession session,
											 Model model) {
		
		if (boardNo == -1) {
			return "redirect:/produceBoard/director";
		}
				
		ProduceBoard produceBoard = produceBoardService.findByBoardNo(boardNo);
		Member member = produceBoardService.findMemberInfor(produceBoard.getWriter());
		ProducerAttach producerAttach = produceBoardService.findByProducerByBoardNo(boardNo);
		Member loginUser = (Member)session.getAttribute("loginuser");
		ProduceSupport produceSupport = produceBoardService.findProduceSupportByMemberIdAndProduceBoardNo(loginUser.getMemberId(), boardNo);
		
		if (produceBoard == null) {
			return "redirect:produceBoard/director";		
		}
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("produceBoard", produceBoard);
		model.addAttribute("producerAttach", producerAttach);
		model.addAttribute("member", member);
		model.addAttribute("produceSupport", produceSupport);
		
		return "produceBoard/directorDetail";
	}
	
	@GetMapping(path = { "/actorDetail" })
	public String produceActorDetailForm(@RequestParam(name="boardno", defaultValue = "-1")int boardNo,
										 HttpSession session,
										 Model model) {
				
		if (boardNo == -1) {
			return "redirect:/produceBoard/actor";
		}
				
		ProduceBoard produceBoard = produceBoardService.findByBoardNo(boardNo);
		Member member = produceBoardService.findMemberInfor(produceBoard.getWriter());
		ProducerAttach producerAttach = produceBoardService.findByProducerByBoardNo(boardNo);
		Member loginUser = (Member)session.getAttribute("loginuser");
		ProduceSupport produceSupport = produceBoardService.findProduceSupportByMemberIdAndProduceBoardNo(loginUser.getMemberId(), boardNo);
				
		if (produceBoard == null) {
			return "redirect:produceBoard/actor";		
		}
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("produceBoard", produceBoard);
		model.addAttribute("producerAttach", producerAttach);
		model.addAttribute("member", member);
		model.addAttribute("produceSupport", produceSupport);
		
		return "produceBoard/actorDetail";
	}
	
	@PostMapping(path = { "/support-producer" }, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String supportProducer(int produceBoardNo, String memberId, int support, Boolean isNew) {
						
		if (isNew == true) {			
			produceBoardService.insertProducerSupport(produceBoardNo, memberId, support);
		}
		else {			
			produceBoardService.supportProducer(produceBoardNo, memberId, support);
		}
		produceBoardService.updateProducerSupportCount(produceBoardNo, support == 1 ? 1 : -1);
		int count = produceBoardService.findAllSuppourtCount(produceBoardNo);
		
		return String.format("{ \"result\" : \"success\", \"count\" : %d }", count);
	}	
	
	@GetMapping(path = { "/editActorInfor" })
	public String editActorInforForm(Model model, 
									 @RequestParam(name="boardno", defaultValue = "-1") int boardNo) {
		ProduceBoard produceBoard = produceBoardService.findInforByBoardNo(boardNo);
		
		if ( boardNo == -1 ) {
			return "redirect:actor";
		}		
		model.addAttribute("produceBoard", produceBoard);
		return "produceBoard/editActorInfor";
	}
	
	@GetMapping(path = { "/editDirectorInfor" })
	public String editDirectorInforForm(Model model, 
									 @RequestParam(name="boardno", defaultValue = "-1") int boardNo) {
		ProduceBoard produceBoard = produceBoardService.findInforByBoardNo(boardNo);
		
		if ( boardNo == -1 ) {
			return "redirect:director";
		}
		
		model.addAttribute("produceBoard", produceBoard);
		return "produceBoard/editDirectorInfor";
	}
	
	@PostMapping(path = { "/editActorInfor" })
	public String editActorInfor(int boardNo, String sns, String infor, String contact) {
		produceBoardService.updateInfor(boardNo, sns, infor, contact);
		return String.format("redirect:actorDetail?boardno=%d", boardNo);
		
	}
	
	@PostMapping(path = { "/editDirectorInfor" })
	public String editDirectorInfor(int boardNo, String sns, String infor, String contact) {
		produceBoardService.updateInfor(boardNo, sns, infor, contact);
		return String.format("redirect:directorDetail?boardno=%d", boardNo);
	}
	
		
	@PostMapping(path = { "/remove-post" })
	@ResponseBody
	public String acceptPost(@RequestParam(name="boardno", defaultValue = "-1")int boardNo) {
		
		produceBoardService.deletedInforByBoardNo(boardNo);
		return "success";
	}
	
	
}
