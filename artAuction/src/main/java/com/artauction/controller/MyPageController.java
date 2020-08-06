
package com.artauction.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artauction.domain.MypageBuyingVO;
import com.artauction.domain.MypageVO;
import com.artauction.domain.UserVO;
import com.artauction.service.MemberService;
import com.artauction.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class MyPageController {


	private MyPageService service;
	private MemberService memService;
	
	@GetMapping("/home")
	public void mypage(Model model, String userid, MypageBuyingVO buyVo) {
		
//		securityContextHolder를 사용해서 현재 세션 사용자 정보 가져오기.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		userid = userDetails.getUsername();
		
		model.addAttribute("userInfo", userDetails);
		
//		응찰한 내용 불러오기
		List<MypageVO> userTradeGoodsInfo = service.userTradeGoodsInfo(userid);
		
		model.addAttribute("userTradeGoodsInfo", userTradeGoodsInfo);
		
		System.out.println("응찰내역 확인!!!!!!!! ---------------");
		System.out.println(service.userTradeGoodsInfo(userid));
		
		
//		구매한 전체 내용 불러오기 //userid는 로그인한 사용자의 id를 의미
		List<MypageBuyingVO> userBuyingGoodsInfo = service.userBuyingGoodsInfo(userid);
		
		List<MypageBuyingVO> buyWait = service.buyWait(userid);
		List<MypageBuyingVO> buyTrading = service.buyTrading(userid);
		List<MypageBuyingVO> buySuccess = service.buySuccess(userid);
		List<MypageBuyingVO> buyCancel = service.buyCancel(userid);
		
//		전체 거래현황 count (거래취소 제외)
		int buyTotal = service.buyWaitCount(userid) + service.buyTradingCount(userid) +  service.buysuccessCount(userid);
		
//		전체 구매현황 List
		model.addAttribute("userBuyingGoodsInfo", userBuyingGoodsInfo);
//		구매현황 List
		model.addAttribute("buyWait", buyWait);
		model.addAttribute("buyTrading", buyTrading);
		model.addAttribute("buySuccess", buySuccess);
		model.addAttribute("buyCancel", buyCancel);
//		구매현황 count 
		model.addAttribute("buyTotal", buyTotal);
		model.addAttribute("buyWaitCount", service.buyWaitCount(userid));
		model.addAttribute("buyTradingCount", service.buyTradingCount(userid));
		model.addAttribute("buysuccessCount", service.buysuccessCount(userid));
		model.addAttribute("buyCancelCount", service.buyCancelCount(userid));
		
		System.out.println("전체 구매내역 확인!!!!!!!! ---------------");
		System.out.println(service.userBuyingGoodsInfo(userid));
		
		
//		판매한 내용 불러오기 //userID는 로그인한 사용자의id를 의미
		List<MypageBuyingVO>userSellGoodsInfo = service.userSellGoodsInfo(userid);
		
		List<MypageBuyingVO>selling = service.selling(userid);
		List<MypageBuyingVO>sellWait = service.sellWait(userid);
		List<MypageBuyingVO>sellTrading = service.sellTrading(userid);
		List<MypageBuyingVO>sellSuccess = service.sellSuccess(userid);
		List<MypageBuyingVO>sellCancel = service.sellCancel(userid);
		List<MypageBuyingVO>sellFail = service.sellFail(userid);

//		전체 판매현황 List
		model.addAttribute("userSellGoodsInfo", userSellGoodsInfo);
//		판매현황 List
		model.addAttribute("selling", selling);
		model.addAttribute("sellWait", sellWait);
		model.addAttribute("sellTrading", sellTrading);
		model.addAttribute("sellSuccess", sellSuccess);
		model.addAttribute("sellCancel", sellCancel);
		model.addAttribute("sellFail", sellFail);
		
		int sellTotal = service.sellingCount(userid)+service.sellWaitCount(userid)+service.sellTradingCount(userid)+service.sellSuccessCount(userid);
		
//		판매현황 count 
		model.addAttribute("sellTotal", sellTotal);
		model.addAttribute("sellingCount", service.sellingCount(userid));
		model.addAttribute("sellWaitCount", service.sellWaitCount(userid));
		model.addAttribute("sellTradingCount", service.sellTradingCount(userid));
		model.addAttribute("sellSuccessCount", service.sellSuccessCount(userid));
		model.addAttribute("sellCancelCount", service.sellCancelCount(userid));
		model.addAttribute("sellFailCount", service.sellFailCount(userid));
		
		System.out.println("판매내역 확인!!!!!!---------------");
		System.out.println(userSellGoodsInfo);
		
		// 알람이 있다면 본것으로 처리하기
		memService.removeAlarm(userid);
	}
	
	
	// ///////////////////////////////////////////////
	// 회원정보 수정								
	// ///////////////////////////////////////////////
	
	@GetMapping("/myInfoChange")
	public void myInfoChange(Model model, String userid, UserVO uVo) {
		
//		securityContextHolder를 사용해서 현재 세션 사용자 정보 가져오기.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		userid = userDetails.getUsername();
		
		model.addAttribute("userInfo", service.info(userid));
	}
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@PostMapping("/myInfoChange")
	public String myInfoChange(UserVO uVo, String userid,Model model ){
		
//		securityContextHolder를 사용해서 현재 세션 사용자 정보 가져오기.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		userid = userDetails.getUsername();
		
		String userPhoneNum =uVo.getUserphonenum();
		String bankAccount =uVo.getBankaccount();
		String bankName =uVo.getBankname();
		String pw = pwencoder.encode(uVo.getPw());
	
		uVo.setUserphonenum(userPhoneNum);
		uVo.setBankaccount(bankAccount);
		uVo.setBankname(bankName);
		uVo.setPw(pw);
		
		System.out.println(uVo);
		
		service.updateInfo(uVo);
		
//		회원정보 변경 후 main에서 alert 발생
		model.addAttribute("message", "회원정보 변경이 완료되었습니다!");
		
		return "redirect:/";
	}
	
	
}