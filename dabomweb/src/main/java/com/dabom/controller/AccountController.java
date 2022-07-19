package com.dabom.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dabom.dto.Email;
import com.dabom.dto.Member;
import com.dabom.service.AccountService;

@Controller
@RequestMapping(path = { "account" })
public class AccountController {

	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping(path = { "/login" })
	public String loginForm() {
		return "account/login";
	}
	
	@PostMapping(path = {"/login"})
	public String login(Member member, HttpSession session, Model model) {
		
		Member member2 = accountService.login(member);
		
		if(member2 != null) {
			session.setAttribute("loginuser", member2);
		}else {
			return "redirect:/account/login?loginFail=로그인 실패";
		}
		
		return "redirect:/home";
	}
	
	@GetMapping(path = {"/register"})
	public String registerForm() {
		
		return "account/register";
		
	}
	
	@PostMapping(path= {"/register"})
	public String register(Member member) {
		
		accountService.registerMember(member);
		
		return "redirect:login";
	}
	
	@GetMapping(path= {"/logout"})
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return "redirect:/home";
	}
	
	@GetMapping(path= {"/findId"})
	public String findIdForm() {
		
		return "account/findId";
		
	}
	
	@PostMapping(path= {"/findId"})
	public String findId(Member member, Model model) {
		
		Member member2 = accountService.selectByMemberIdAndEmail(member);
		
		if(member2 == null) {
			model.addAttribute("findFail", true);
			return "account/findId";
		}
		
		Email dto =accountService.finId(member2.getMemberId(), member2.getPasswd(), member2.getEmail());
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			//true: 멀티파트 메세지를 사용하겠다는 의미 
			
            /* 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
			
			mailHelper.setFrom("hwan2737@naver.com");
			// 빈에 아이디 설정한 것은 단순히 SMTP 인증을 받기 위해 사용한 것. 따라서 보내는이(setFrom()) 또한 반드시 필요.
            // 보내는 이의 메일 주소와 이름이 모두 표기 되기를 원한다면 아래의 코드를 사용하면 된다.
            // mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(dto.getAddress());
			mailHelper.setSubject(dto.getTitle());
			mailHelper.setText(dto.getMessage()); 
			//true: html을 사용하겠다는 의미 
			/*단순한 텍스트만 사용한다면 아래 코드를 사용하면 된다.
			mailHelper.setText(content); */
			
			mailSender.send(mail);
			
		}catch(Exception e){
			
			e.printStackTrace();
		
	}
		
		return "redirect:login";
	}

	
}
