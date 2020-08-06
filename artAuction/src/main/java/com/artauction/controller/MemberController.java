package com.artauction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artauction.domain.UserVO;
import com.artauction.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	private MemberService service;
	
	@GetMapping("/join")
	public void joinGet() {
	}

	@PostMapping("/join")
	public String joinPost(UserVO uVo, Model model) {
		//먼저 id중복체크
		int idCheck = service.idCheck(uVo.getUserid());
		
		String pw = pwencoder.encode(uVo.getPw());
		uVo.setPw(pw);
		
		System.out.println("id중복체크 : "+idCheck);
		System.out.println("pw 인코딩 : "+pw);
		
		if(idCheck<1) {
			// 중복이 아닌경우 mapper에 insert
			// 새로운 user는 "ROLE_USER";
			service.userRegister(uVo);
			
			model.addAttribute("message", uVo.getUserid()+" 님 회원가입에 성공하였습니다!");
			return "/main";
		}else {
			// 중복인 경우
			model.addAttribute("message", "중복되는 id입니다");
			model.addAttribute("returnName", uVo.getUsername());
			model.addAttribute("returnPhone", uVo.getUserphonenum());
			
			return "/member/join";
		}
		
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/login")
	public String doLogin(UserVO uVo, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", uVo.getUserid()+"님 환영합니다.");
		return "/main";
	}
	
	@GetMapping("/customLogin")
	public void loginInput(UserVO uVo, String error, String logout, Model model, String message) {
		
		if(error != null) {
			model.addAttribute("error", "아이디 혹은 비밀번호를 확인해주세요");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃되었습니다.");
		}
		System.out.println("231231231321");
		System.out.println(message);
		if(message != null) {
			model.addAttribute("message", message);
		}
		
	}

	@GetMapping("/customLogout")
	public void customLogoutGet() {
		
	}
	@PostMapping("/customLogout")
	public void customLogoutPost() {
		
	}
	
	// id/pw 찾기 페이지 이동
	@GetMapping("/findID")
	public void findID() {}
	
	
	
	
	
	
	//테스트 이동위한 임시페이지
	@GetMapping("/testPage")
	public void testPage() {
		
	}
	
}
