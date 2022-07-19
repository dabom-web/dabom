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
import com.dabom.dto.MyChannel;
import com.dabom.dto.PointPurchase;
import com.dabom.dto.WebtoonBoard;
import com.dabom.service.AccountService;
import com.dabom.service.MypageService;
import com.dabom.service.PointPurchaseService;

@Controller
@RequestMapping(path = { "/mypage" })
public class MypageController {
	
	@Autowired
	@Qualifier("pointPurchaseService")
	private PointPurchaseService pointPurchaseService;
	
	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;
	
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypageService;

	@GetMapping(path = { "/profile" })
	public String showProfile(HttpSession session, Model model) {
	
		Member loginUser = (Member)session.getAttribute("loginuser");
		
		MyChannel myChannel = mypageService.findMyChannelByLoginUserMemberId(loginUser.getMemberId());
		List<WebtoonBoard> webtoonTitleList = mypageService.findWebtoonListByMemberIdOfWriter(loginUser.getMemberId());
		
		model.addAttribute("myChannel", myChannel);
		model.addAttribute("webtoonList", webtoonTitleList);
		
		
		
		if (loginUser.getPoint() == 0) {
			
			List<PointPurchase> pointList = null;
			int totalPoint = 0;
			int totalAmount = 0;
			int totalUsePoint = 0;
			model.addAttribute("pointList", pointList);
			model.addAttribute("totalPoint", totalPoint);
			model.addAttribute("totalAmount", totalAmount);
			model.addAttribute("totalUsePoint", totalUsePoint);

		} else {
		
		//List<PointPurchase> pointList = pointPurchaseService.findPointListByMemberId(loginUser.getMemberId());
		List<PointPurchase> pointList = pointPurchaseService.findPointList(loginUser.getMemberId());
		int totalPoint = pointPurchaseService.findTotalPriceByMemberId(loginUser.getMemberId());
		int totalAmount = pointPurchaseService.findTotalAmountByMemberId(loginUser.getMemberId());
		int totalUsePoint = pointPurchaseService.findTotalUsePointByMemberId(loginUser.getMemberId());
		model.addAttribute("pointList", pointList);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("totalUsePoint", totalUsePoint);
		}
		return "mypage/profile";
	}
	
	@PostMapping(path = { "/updateMemberInfor" })
	public String updateMemberInfor(@RequestParam(name="memberId")String memberId,
									@RequestParam(name="nickName")String nickName,
									@RequestParam(name="birth")int birth,
									@RequestParam(name="email")String email,
									@RequestParam(name="phone")int phone,
									@RequestParam(name="userName")String userName,
									@RequestParam(name="type")String type, 
									HttpSession session) {
		mypageService.updateMemberInfor(memberId, nickName, birth, email, phone, userName);
		mypageService.updateUserType(memberId, type);

		Member member2 = mypageService.selectUpdateByMemberId(memberId);		
		session.setAttribute("loginuser", member2);
		
//		//2. 
//		Member loginUser = (Member)session.getAttribute("loginuser");
//		loginUser.setNickName(nickName);
//		loginUser.setBirth(birth);
//		// ....
		
		return "redirect:profile";	
	}
	
	@PostMapping(path = { "/change-type" })
	@ResponseBody
	public String changeUserTypeByMemberId(@RequestParam(name="memberId")String memberId, 
										   @RequestParam(name="type")String type,
										   HttpSession session) {
		mypageService.changeUserTypeByMemberId(memberId, type);
		Member member2 = mypageService.selectUpdateByMemberId(memberId);		
		session.setAttribute("loginuser", member2);
		return "success";
	}
	
	
	@PostMapping(path = { "/delete-account" })
	@ResponseBody
	public String deleteAccount(String memberId) {
		accountService.deleteAccountByMemberId(memberId);
		return "success";
	}
	
	@PostMapping(path = { "/disabled-account" })
	@ResponseBody
	public String disabledAccount(String memberId) {
		accountService.disabledAccountByMemberId(memberId);
		return "success";
	}
	
	

	

}
