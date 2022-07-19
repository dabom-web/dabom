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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dabom.dto.Member;
import com.dabom.dto.PointPurchase;
import com.dabom.service.MypageService;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/payment" })
public class PointPurchaseController {

	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypageService;
	
	@GetMapping(path = { "/purchase-point" })
	public String paymentForm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginuser");
		List<PointPurchase> pointPurchaseList = pointPurchaseService.findPointPurchaseByMemberId(loginUser.getMemberId());
		model.addAttribute("pointPurchaseList", pointPurchaseList);
		
		
		
		return "payment/purchase-point";
	}
	
	@PostMapping(path= {"/purchase-point"})
	public String payment(PointPurchase pointPurchase, HttpSession session,@RequestParam(name="memberId")String memberId) {
		
		// 데이터베이스에 데이터 저장
		pointPurchaseService.purchasePoint(pointPurchase);
		pointPurchaseService.plusPointByMemberId(pointPurchase);
		
		Member member2 = mypageService.selectUpdateByMemberId(memberId);		
		session.setAttribute("loginuser", member2);
		
		return "redirect:purchase-point";
	}
	
	@GetMapping(path = { "/use-point" })
	public String usePointform() {
	
		return "payment/use-point";
	}
	
	@PostMapping(path = { "/use-point" })
	@ResponseBody
	public String usePoint(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginuser");
		if (loginUser.getPoint() == 0) {
			return "redirect:purchase-point";
		}
		
		pointPurchaseService.usePointByMemberIdInsert(loginUser.getMemberId());
		pointPurchaseService.usePointByMemberId(loginUser.getMemberId());
		return "success";
	}
	
	@PostMapping(path = { "/use-point-dropdown" })
	@ResponseBody
	public String usePointDropdown(HttpSession session, 
								   @RequestParam(name = "usePoint")int usePoint) {
		Member loginUser = (Member)session.getAttribute("loginuser");
		if (loginUser.getPoint() == 0) {
			return "redirect:purchase-point";
		}
		pointPurchaseService.dropdownUsePointByMemberIdInsert(loginUser.getMemberId(), usePoint);
		pointPurchaseService.dropdonwUsePointByMemberId(loginUser.getMemberId(), usePoint);
		return "success";
	}
	

	
}
