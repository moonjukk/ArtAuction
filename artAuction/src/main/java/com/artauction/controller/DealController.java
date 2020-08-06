	package com.artauction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.MessageVO;
import com.artauction.mapper.MemberMapper;
import com.artauction.service.DealService;
import com.artauction.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/deal/")
@AllArgsConstructor
public class DealController {
	
	private DealService dealService;
	private MemberService memService;
	private MemberMapper memberMapper;
	
	
	
	@GetMapping("/buy")
	public String temp(GoodsVO gVo, Model model, MessageVO mVo, RedirectAttributes rttr) {
		GoodsVO getGVO = dealService.findByGno(gVo.getGno());
		rttr.addAttribute("message", mVo.getMessage());
		System.out.println("왜 : "+getGVO.getRegisteruserid());
		return "redirect:/deal/buying?gno="+gVo.getGno()+"&registeruserid="+getGVO.getRegisteruserid()+"&buyinguserid="+getGVO.getBuyinguserid();
	}

	
	@GetMapping("/buying")
	@PreAuthorize("(principal.username == #gVo.registeruserid) or (principal.username == #gVo.buyinguserid) or (hasRole('ROLE_ADMIN'))")
	public String buying(GoodsVO gVo, Model model,RedirectAttributes rttr, MessageVO mVo) {
		String regId = gVo.getRegisteruserid();
		String buyId = gVo.getBuyinguserid();
		/*
		0 : 경매중

		1 : 입금대기
		2 : 입금대기(판매자만 입금버튼 누름)
		3 : 입금대기(구매자만 입금버튼 누름)
		
		4 : 거래중
		5 : 거래중(판매자만 거래완료버튼 누름)
		6 : 거래중(구매자만 거래완료버튼 누름)
		
		7 : 거래완료 (종료)
		
		a : 판매자가 거래취소신청
		b : 구매자가 거래취소 신청
		c : 거래가 정상적으로 취소
		
		d : 응찰자없음 경매종료
		*/
		
		GoodsVO getGVO = dealService.findByGno(gVo.getGno());
		
		System.out.println("입장값 : "+regId.equals(getGVO.getRegisteruserid()));
		System.out.println("입장값 : "+buyId.equals(getGVO.getBuyinguserid()));
		
		// gVo데이터
		char flag = getGVO.getFlag();
		
		if(flag=='0' || !regId.equals(getGVO.getRegisteruserid()) || !buyId.equals(getGVO.getBuyinguserid())){
			if(!(flag=='d')&& !regId.equals(getGVO.getRegisteruserid())){
				System.out.println("!!! url수정을 통한 이상접근 감지");
				rttr.addFlashAttribute("message", "잘못된 접근입니다.");
				return "redirect:/";
			}
		}
		
		model.addAttribute("goodsData", getGVO);
		
		String message = mVo.getMessage();
		if(message!=null) {
			if(message.equals("sessionout_")) {
				model.addAttribute("message","세션이 만료되었습니다. 다시 시도해주세요.");
			}
			if(message.equals("success_")) {
				model.addAttribute("message","정상적으로 처리되었습니다.");
			}
			if(message.equals("fail_")) {
				model.addAttribute("message","비정상적인 시도가 감지되었습니다.");
			}
		}
		
		//입찰 시작일 구하기
		model.addAttribute("startTime", dealService.getStartTime(gVo.getGno()));
		//입찰 종료일 구하기
		model.addAttribute("endTime", dealService.getEndTime(gVo.getGno()));
		//총 몇명의 입찰자가 있었는지
		model.addAttribute("biddingCount", dealService.getBiddingCount(gVo.getGno()));
		//판매자 개인정보 get
		model.addAttribute("salerInfo", dealService.getSalerInfo(gVo.getGno()));
		//구매자 개인정보 get
		model.addAttribute("buyerInfo", dealService.getBuyerInfo(gVo.getGno()));
		
		// 대표이미지 get
		ImageVO thumbIVo = dealService.findThumbImageByGno(gVo.getGno());
		String path = thumbIVo.getUploadpath();
		String uuid = thumbIVo.getUuid();
		String fileName = thumbIVo.getFilename();
		String thumbQuery = "/img/"+path+"/"+uuid+"_"+fileName;
		model.addAttribute("thumbImg", thumbQuery);
		
		// 나머지이미지 get
		model.addAttribute("imgListData", dealService.findImageByGno(gVo.getGno()));
		
		// 이미지가 총 몇개인가?
		model.addAttribute("cntImg", dealService.cntImg(gVo.getGno()));
		
		List<ImageVO> list = dealService.findImageByGno(gVo.getGno());
		
		return "/deal/buying";
		
	}
	
	
	
	
	@PostMapping("/action")
	public String action(RedirectAttributes rttr, GoodsVO gVo, Model model) {
		
		GoodsVO beforeGVO = dealService.findByGno(gVo.getGno());
		
		// db의 flag는  입력한 flag보다 앞설 수 없다 
		// 앞선다면 sessionout처리하여 새로고침을 유도한다
		String msg = "sessionout";
		
		if(beforeGVO.getFlag()=='2') {
			if(gVo.getFlag()=='3') {
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}else if(beforeGVO.getFlag()=='3') {
			if(gVo.getFlag()=='2') {
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}else if(beforeGVO.getFlag()=='5') {
			if(gVo.getFlag()=='6') {
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}else if(beforeGVO.getFlag()=='6') {
			if(gVo.getFlag()=='5') {
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}
		// 거래상태의 상품을 입금대기상태로 돌리려 시도하는 경우
		if(beforeGVO.getFlag()=='4' || beforeGVO.getFlag()=='5' || beforeGVO.getFlag()=='6') {
			if(gVo.getFlag()=='1' || gVo.getFlag()=='2' || gVo.getFlag()=='3') {
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}
		// 거래가 종료된 상품의 flag를 수정하려하는 경우
		if(beforeGVO.getFlag()=='7') {
			return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
		}
		// 거래취소(신청)상태의 상품을 입금대기상태로 돌리려 시도하는 경우
		if(beforeGVO.getFlag()=='a') {
			if(gVo.getFlag()=='b') {
				gVo.setFlag('c');
				dealService.updateFlag(gVo);
				msg = "success";
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}
		if(beforeGVO.getFlag()=='b') {
			if(gVo.getFlag()=='a') {
				gVo.setFlag('c');
				dealService.updateFlag(gVo);
				msg = "success";
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}
		if(beforeGVO.getFlag()=='a' || beforeGVO.getFlag()=='b' || beforeGVO.getFlag()=='c' || beforeGVO.getFlag()=='d') {
			if( !(gVo.getFlag()=='c') ) {
				msg = "fail";
				return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
			}
		}
		
		
		dealService.updateFlag(gVo);
		msg = "success";
		
		System.out.println("*********************");
		System.out.println(gVo.getFlag());
		
		if(gVo.getFlag()=='2' || gVo.getFlag()=='5' || gVo.getFlag()=='a') {
			// 판매자가 먼저 버튼을 누른경우 구매자에게 알람
			memberMapper.setAlarm(beforeGVO.getBuyinguserid());
		}else if(gVo.getFlag()=='3' || gVo.getFlag()=='6' || gVo.getFlag()=='b') {
			// 구매자가 먼저 버튼을 누른경우 판매자에게 알람
			memberMapper.setAlarm(beforeGVO.getRegisteruserid());
		}else {
			// 모두에게 알람
			memberMapper.setAlarm(beforeGVO.getBuyinguserid());
			memberMapper.setAlarm(beforeGVO.getRegisteruserid());
		}
		
		if(gVo.getFlag()=='7') {
			System.out.println(gVo.getFlag());
			memService.reliabilityInput(beforeGVO.getBuyinguserid(), "TRADE_SUCCESS");
			memService.reliabilityInput(beforeGVO.getRegisteruserid(), "TRADE_SUCCESS");
		}
		if(gVo.getFlag()=='c') {
			System.out.println(gVo.getFlag());
			memService.reliabilityInput(beforeGVO.getBuyinguserid(), "TRADE_FAIL");
			memService.reliabilityInput(beforeGVO.getRegisteruserid(), "TRADE_FAIL");
		}
		
		return "redirect:/deal/buy?gno=" + gVo.getGno()+"&message="+msg;
	}
	
}
