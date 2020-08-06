package com.artauction.controller;

import java.net.ServerSocket;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artauction.domain.AdminSearchVO;
import com.artauction.domain.AuthVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.GoodsVO;
import com.artauction.domain.PageDTO;
import com.artauction.domain.UserVO;
import com.artauction.domain.adminCriteria;
import com.artauction.domain.adminCriteria2;
import com.artauction.domain.adminGoodsVO;
import com.artauction.service.ListService;
import com.artauction.service.MemberService;
import com.artauction.service.RegisterService;

import lombok.AllArgsConstructor;

import com.artauction.socketHandler.WebSocketHandler;

@Controller
@AllArgsConstructor
public class MainController {
	
	// 레지스터서비스에서 이미지 호출_임시
	private RegisterService regService;
	// 유저정보 로드할 서비스
	private MemberService membService;
	// 리스트 불러오기
	private ListService listService;
	
	@GetMapping("/")
	public String main(Model model,Criteria cri,@Param("message") String message) {
		if(message != null) {
			model.addAttribute("message", message);
		}
		model.addAttribute("recommendList",listService.getRecommend(cri));
		return "main";
	}
	
	@GetMapping("/faq")
	public void faq() {}
	
	@GetMapping("/service")
	public void service() {}
	
	@GetMapping("/admin")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public void admin(Model model, adminCriteria adminCri) {
		System.out.println("!! 관리자가 admin페이지에 접속하였습니다.");
		System.out.println(adminCri);
		model.addAttribute("userlist",membService.getListWithPaging(adminCri));
		model.addAttribute("adminCriPage",adminCri.getPageNum());
		model.addAttribute("getTotalUser",membService.getTotalUser());
	}
	
	@GetMapping("/adminMember")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String adminMember(Model model, UserVO uVo, AdminSearchVO asVO) {
		System.out.println(uVo);
		System.out.println(asVO.getType().equals("byId"));
		System.out.println(asVO);
		
		// 아이디 혹은 이름으로 검색
		List<UserVO> searchUserList = membService.searchById(asVO);
		model.addAttribute("userlist",searchUserList);
		model.addAttribute("adminCriPage",1);
		model.addAttribute("getTotalUser",membService.searchByIdCount(asVO));
		if(searchUserList.size()==12) {
			model.addAttribute("message","검색 시 최대 조회결과는 12건까지 가능합니다");	
		}
		return "/admin";
	}
	
	// 물품정보 search
	@GetMapping("/adminGoodsSearch")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String adminGoodsSearch(Model model, AdminSearchVO asVO) {
		
		System.out.println(asVO.getType().equals("byId"));
		System.out.println(asVO.getType().equals("byGoods"));
		
		System.out.println(asVO);

		// 아이디 혹은 gname으로 검색 
		List<adminGoodsVO> searchGoodsList = membService.searchGoodsById(asVO);
		model.addAttribute("goodsList",searchGoodsList);
		model.addAttribute("adminCriPage",1);
		model.addAttribute("getTotalGoods", searchGoodsList.size());
		if(searchGoodsList.size()==7) {
		model.addAttribute("message","검색 시 최대 조회결과는 7건까지 가능합니다"); }
		
		return "/adminGoods";
	}
	
	
	@PostMapping("/adminMemberModify")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String adminMemberModify(Model model, UserVO uVo, AdminSearchVO asVO) {
		System.out.println("수정요청정보 : "+uVo);
		System.out.println(asVO);
		
		membService.modifyMemberByAdmin(uVo);
		System.out.println(uVo.getUserid()+"의 회원정보 수정완료");
		
		return "redirect:/"+asVO.getBeforeURL();
	}
	
	@GetMapping("/adminGoods")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public void adminGoods(Model model, adminCriteria2 adminCri) {

		System.out.println("!!! 관리자가 물품관리 페이지에 접속하였습니다");
		System.out.println(adminCri);
		System.out.println(membService.getGoodsListWithPaging(adminCri));
		model.addAttribute("goodsList",membService.getGoodsListWithPaging(adminCri));
		model.addAttribute("adminCriPage",adminCri.getPageNum());
		model.addAttribute("getTotalGoods",membService.getTotalGoods());
		
	}
	
	@PostMapping("/adminGoodsModify")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String adminGoodsModify(Model model, GoodsVO gVo, AdminSearchVO asVO) {
		
		System.out.println("!!! 관리자에 의해 물품정보가 수정됩니다.");
		System.out.println(gVo);
		System.out.println(asVO);
		
		membService.modifyGoodsByAdmin(gVo);
		System.out.println(gVo.getGno()+"의 물품정보 수정완료");
		
		return "redirect:/"+asVO.getBeforeURL();
	}
	
	
	@PostMapping("/adminMemberAuth")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String adminMemberAuth(Model model, AuthVO aVo, AdminSearchVO asVO) {
		
		membService.adminMemberAuth(aVo);
		return "redirect:/"+asVO.getBeforeURL();
		
	}
	
	
	@PostMapping("/deleteGoodsByAdmin")
	@PreAuthorize("(hasRole('ROLE_ADMIN'))")
	public String deleteGoodsByAdmin(Model model, GoodsVO gVo, AdminSearchVO asVO) {
		System.out.println("!!! 경매정보 삭제를 시도합니다 : "+gVo);
		membService.deleteGoodsByAdmin(gVo);
		System.out.println("!!! 경매정보 삭제를 완료하였습니다 : "+gVo.getGno());
		return "redirect:/"+asVO.getBeforeURL();
		
	}
	
	
	@PostMapping("/findUserPassword")
	@PreAuthorize("permitAll")
	public String findUserPassword(Model model, UserVO uVo, RedirectAttributes rttr) {
		System.out.println("비밀번호 찾기 요청정보 : "+uVo);
		String tempPw = Integer.toString((int)(Math.random()*100000));
		System.out.println("임시비밀번호 : "+tempPw);
		uVo.setTemppw(tempPw);
		String password = membService.findUserPw(uVo);
		
		if(password.equals("no_user")) {
			model.addAttribute("message", "일치하는 회원정보가 없습니다.");
			return "/member/findID";
		}else {
			rttr.addAttribute("message", tempPw);
			return "redirect:/member/customLogin";
		}
	}

	@PostMapping("/findUserId")
	@PreAuthorize("permitAll")
	public String findUserId(Model model, UserVO uVo, RedirectAttributes rttr) {
		System.out.println("아이디 찾기 요청정보 : "+uVo);
		String userid = membService.findUserId(uVo);
		
		if(userid.equals("no_user")) {
			model.addAttribute("message", "일치하는 회원정보가 없습니다.");
			return "/member/findID";
		}else {
			model.addAttribute("message", "아이디 : "+userid);
			return "/member/findID";
		}
		
	}
}

