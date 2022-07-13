package com.dabom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.PointPurchase;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/payment" })
public class PointPurchaseController {

	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	
	@GetMapping(path = { "/purchase-point" })
	public String paymentForm() {
		return "payment/purchase-point";
	}
	
	@PostMapping(path= {"/purchase-point"})
	public String payment(PointPurchase pointPurchase) {
		
		// 데이터베이스에 데이터 저장
		pointPurchaseService.purchasePoint(pointPurchase);
		
		return "redirect:/home";
		
	}
}
