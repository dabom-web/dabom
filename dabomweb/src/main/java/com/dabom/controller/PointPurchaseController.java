package com.dabom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dabom.dto.Member;
import com.dabom.dto.PointPurchase;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/payment" })
public class PointPurchaseController {

	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	
	@GetMapping(path = { "/purchase-point" })
	public String paymentForm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginuser");
		List<PointPurchase> pointPurchaseList = pointPurchaseService.findPointPurchaseByMemberId(loginUser.getMemberId());
		
		model.addAttribute("pointPurchaseList", pointPurchaseList);
		
		return "payment/purchase-point";
	}
	
	@PostMapping(path= {"/purchase-point"})
	public String payment(PointPurchase pointPurchase) {
		
		// 데이터베이스에 데이터 저장
		pointPurchaseService.purchasePoint(pointPurchase);
		pointPurchaseService.plusPointByMemberId(pointPurchase);
		
		return "redirect:purchase-point";
	}
	
	@GetMapping(path = { "/use-point" })
	public String usePointform(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginuser");
		int havePoint = pointPurchaseService.searchHavePointByLoginUser(loginUser.getMemberId());
		model.addAttribute("havePoint", havePoint);
		return "payment/use-point";
	}
	
	@PostMapping(path = { "/use-point" }, produces = {"application/json; charset=utf-8"})
	@ResponseBody
	public String usePoint(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginuser");
		pointPurchaseService.usePointByMemberIdInsert(loginUser.getMemberId());
		pointPurchaseService.usePointByMemberId(loginUser.getMemberId());
		return "success";
	}
	
//	@PostMapping(path = { "/use-point" })
//	public String usePoint(PointPurchase pointPurchase, String memberId) {
//		pointPurchaseService.usePointByMemberIdInsert(pointPurchase);
//		pointPurchaseService.usePointByMemberId(memberId);
//		return "success";
//	}
	

	
}
