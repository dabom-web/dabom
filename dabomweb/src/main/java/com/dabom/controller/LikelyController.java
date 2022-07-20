package com.dabom.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class LikelyController {

//	@PostMapping(path = { "/likely" }, produces = {"application/json;charset=utf-8"})
//	@ResponseBody
//	public String supportProducer(int produceBoardNo, String memberId, int support, Boolean isNew) {
//						
//		if (isNew == true) {			
//			produceBoardService.insertProducerSupport(produceBoardNo, memberId, support);
//		}
//		else {			
//			produceBoardService.supportProducer(produceBoardNo, memberId, support);
//		}
//		produceBoardService.updateProducerSupportCount(produceBoardNo, support == 1 ? 1 : -1);
//		int count = produceBoardService.findAllSuppourtCount(produceBoardNo);
//		
//		return String.format("{ \"result\" : \"success\", \"count\" : %d }", count);
//	}	
}
