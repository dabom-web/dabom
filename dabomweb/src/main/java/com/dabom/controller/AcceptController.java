package com.dabom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dabom.dto.Member;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProducerAttach;
import com.dabom.service.ProduceBoardService;

@Controller
@RequestMapping(path = { "/administerPrivilege" })
public class AcceptController {

	@Autowired
	@Qualifier("produceBoardService")
	private ProduceBoardService produceBoardService;
	
	@GetMapping(path = { "/accept" })
	public String acceptList(Model model) {
		
		List<ProduceBoard> produceList = produceBoardService.findProduceList();
		model.addAttribute("produceList",produceList);
		
		return "administerPrivilege/accept";
	}
	
	@GetMapping(path = { "/acceptDetail" })
	public String produceActorDetailForm(Model model,
									@RequestParam(name="boardno", defaultValue = "-1")int boardNo) {
		
		if (boardNo == -1) {
			return "redirect:/administerPrivilege/acceptDetail";
		}
				
		ProduceBoard produceBoard = produceBoardService.findByBoardNo(boardNo);
		Member member = produceBoardService.findMemberInfor(produceBoard.getWriter());
		ProducerAttach producerAttach = produceBoardService.findByProducerByBoardNo(boardNo);
		
		if (produceBoard == null) {
			return "redirect:/administerPrivilege/acceptDetail";		
		}
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("produceBoard", produceBoard);
		model.addAttribute("producerAttach", producerAttach);
		model.addAttribute("member", member);
		
		return "administerPrivilege/acceptDetail";
	}
	
	
	@PostMapping(path = { "/accept-post" })
	@ResponseBody
	public String acceptPost(@RequestParam(name="boardno", defaultValue = "-1")int boardNo, int ok) {
		
		produceBoardService.updateAcceptPost(boardNo, ok);
		return "success";
	}
	
}
