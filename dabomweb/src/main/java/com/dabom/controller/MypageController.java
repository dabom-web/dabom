package com.dabom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.Member;
import com.dabom.dto.PointPurchase;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/mypage" })
public class MypageController {
	
	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	
	@GetMapping(path = { "/profile" })
	public String showProfile(HttpSession session, Model model) {
		
		//결제 정보
		Member loginUser = (Member)session.getAttribute("loginuser");
		List<PointPurchase> pointPurchaseList = pointPurchaseService.findPointPurchaseByMemberId(loginUser.getMemberId());
		model.addAttribute("pointPurchaseList", pointPurchaseList);
		
		return "mypage/profile";
	}
	
	

	

}
