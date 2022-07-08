package com.dabom.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.ProduceBoard;
import com.dabom.dto.ProducerAttach;
import com.dabom.service.ProduceBoardService;



@Controller
@RequestMapping(path = { "/produceBoard" })
public class ProduceBoardController {

	
	@Autowired
	@Qualifier("produceBoardService")
	private ProduceBoardService produceBoardService;
	
	@GetMapping(path = { "/directer" })
	public String directerInforList() {
		
		
		
		return "produceBoard/directer";
	}
	
	@GetMapping(path = { "/writeDirecterInfor" })
	public String writeDirecterInforForm() {
		return "produceBoard/writeDirecterInfor";
	}
	
	@PostMapping(path = {"/writeDirecterInfor"})
	public String writeDirecterInfor(ProduceBoard produceBoard,
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
		return "redirect:/produceBoard/directer";
	}
	
	@GetMapping(path = { "/actor" })
	public String actorInforList() {
		return "produceBoard/actor";
	}
	
	@GetMapping(path = { "/writeActorInfor" })
	public String writeActorInforForm() {
		return "produceBoard/writeActorInfor";
	}
	
	@PostMapping(path = {"/writeActorInfor"})
	public String writeActorInfor(ProduceBoard produceBoard,
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
		return "redirect:/produceBoard/actor";
		
	}
	
}
