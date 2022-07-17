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

import com.dabom.dto.Member;
import com.dabom.dto.PointPurchase;
import com.dabom.service.AccountService;
import com.dabom.service.MypageService;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/mypage" })
public class MypageController {
	
	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	@Qualifier("accountService")
	private AccountService accountService;
	
	@Qualifier("mypageService")
	private MypageService mypageService;
	
	@GetMapping(path = { "/profile" })
	public String showProfile(HttpSession session, Model model) {
		
		//결제 정보
		Member loginUser = (Member)session.getAttribute("loginuser");
		List<PointPurchase> pointPurchaseList = pointPurchaseService.findPointPurchaseByMemberId(loginUser.getMemberId());
		int totalPrice = pointPurchaseService.findTotalPriceByMemberId(loginUser.getMemberId());
		int totalAmount = pointPurchaseService.findTotalAmountByMemberId(loginUser.getMemberId());
		int totalUsePoint = pointPurchaseService.findTotalUsePointByMemberId(loginUser.getMemberId());
		
		model.addAttribute("pointPurchaseList", pointPurchaseList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("totalUsePoint", totalUsePoint);
		
		
		return "mypage/profile";
	}
	
	@PostMapping(path = { "/updateMemberInfor" })
	public String updateMemberInfor(@RequestParam(name="memberId")String memberId,
									@RequestParam(name="nickName")String nickName,
									@RequestParam(name="birth")int birth,
									@RequestParam(name="email")String email,
									@RequestParam(name="phone")int phone,
									@RequestParam(name="userName")String userName,
									@RequestParam(name="type")String type ) {
		mypageService.updateMemberInfor(memberId, nickName, birth, email, phone, userName);
		mypageService.updateUserType(memberId, type);
	return "redirect:mypage/profile";	
	}
	
	

	

}
