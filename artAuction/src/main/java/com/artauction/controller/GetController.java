package com.artauction.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.InquireVO;
import com.artauction.domain.TradeVO;
import com.artauction.service.GetService;
import com.artauction.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/get/*")
public class GetController {

	//get�쑝濡� model媛� �꽆寃⑥＜湲�
	private GetService service;
	private MemberService memService;
	
	@GetMapping("/goods")
	@PreAuthorize("permitAll") //상세보기 페이지는 모든사용자가 읽기 가능
	public String get(@RequestParam("gno") int gno, Model model) {
		//理쒓퀬媛� 援ы븯�뒗 怨꾩궛�떇
		int startPrice = service.read(gno).getStartprice();
		int divisionPrice = service.read(gno).getDivisionprice();
		int countBidder =service.countBidder(gno);
		int nowPrice = startPrice +(divisionPrice * countBidder);
		
		model.addAttribute("getData", service.read(gno));
		//�쓳李곗옄 �닔 援ы븯湲�
		model.addAttribute("countBidder", service.countBidder(gno));
		//理쒓퀬 �쓳李곗옄 id援ы븯湲�
		model.addAttribute("highBidder", service.highBidder(gno));
		//�쁽�옱 理쒓퀬媛� 援ы븯湲�
		model.addAttribute("nowprice", nowPrice);
		//�엯李� �떆�옉�씪 援ы븯湲�
		model.addAttribute("startTime", service.startTime(gno));
		//�엯李� 醫낅즺�씪 援ы븯湲�
		model.addAttribute("endTime", service.endTime(gno));
		
		//�뜽�꽕�씪 �씠誘몄� 蹂대궡湲�
		model.addAttribute("thumbImg", service.thumbnailImg(gno));
		//�뜽�꽕�씪 �젣�쇅�븳 �씠誘몄� 蹂대궡湲�
		model.addAttribute("imgListData", service.findImg(gno));
		//�씠誘몄�媛� 珥� 紐뉕컻�씤媛�?
		model.addAttribute("cntImg", service.cntImg(gno));
		
		// 상품 문의사항 get
		model.addAttribute("inquireList", service.inquireOutput(gno));
		
		// 판매자의 신용정보 get
		model.addAttribute("reliability", memService.reliabilityGet(service.read(gno).getRegisteruserid()));
		
		// 카테고리 명 get
		model.addAttribute("categoryName", service.getCategoryName(service.read(gno).getCategoryid()));
		
		return "/get";
		
	}
	
	//modal�뿉�꽌 �쓳李고븯湲� 踰꾪듉 �늻瑜대㈃ insert�릺�룄濡� 援ы쁽
	@PostMapping("/bid")
	@PreAuthorize("isAuthenticated()") //입찰하는 페이지는 로그인 한 사용자만 확인 가능
	public String postBidPriceInsert(GoodsVO gVo, TradeVO tVo) {
		System.out.println("�쓳李고븯湲�....");
//		
//		//userid瑜� 媛뺤젣濡� �엯�젰�빐�꽌 吏꾪뻾�빐�빞 �븿.
		//get.jsp�뿉�꽌 userid 瑜� hidden�쑝濡�. value="buyer03"�쑝濡� �빐�꽌 蹂대궡湲�
//		tVo.setUserid("buyer03");
		
		System.out.println("�쁽�옱媛�寃쯶Price : "+tVo.getTprice());
		System.out.println("�쁽�옱 �긽�뭹�쓽 踰덊샇�뒗 : "+tVo.getGno());
		
		//service�뿉 媛��졇�삩 媛믪쓣 �꽆湲곌린
		service.bidPriceInsert(tVo);
		
		//�쓳李고븯怨� �떎�떆 get page濡� �룎�븘�삤湲�
		System.out.println("�쓳李� �셿猷�");
		//test�슜�씠�씪 gno踰덊샇瑜� �옉�꽦�빐�몺,,
		return "redirect:/get/goods?gno="+gVo.getGno();
	}
	
	
	
	// 상품문의 등록
	@PostMapping("/inquire")
	@PreAuthorize("permitAll")
	public String inquire(Model model, InquireVO iVo) {
		System.out.println(iVo);
		service.inquireInput(iVo);
		return "redirect:/get/goods?gno="+iVo.getGno();
	}

	// 상품문의 답변
	@PostMapping("/inquireReply")
	@PreAuthorize("isAuthenticated()")
	public String inquireReply(Model model, InquireVO iVo) {
		System.out.println("-------------iVo test-------------");
		System.out.println(iVo);
		service.inquireReply(iVo);
		return "redirect:/get/goods?gno="+iVo.getGno();
	}

	// 상품즉시구매
	@PostMapping("/nowBuy")
	@PreAuthorize("isAuthenticated()")
	public String nowBuy(Model model, GoodsVO gVo, TradeVO tVo) {
		System.out.println("---즉시구매테스트---");
		System.out.println(gVo);
		System.out.println(tVo);
		System.out.println("---즉시구매테스트---");
		// 1. gno로 플래그 체크
		// 2. 플래그에 이상이 없다면 즉시구매 transaction
		int nowBuy = service.nowBuy(tVo);
		if(nowBuy==1) {
			// 업데이트가 성공한 경우
			return "redirect:/deal/buy?gno="+tVo.getGno();
		}else {
			// 업데이트가 실패한 경우
			model.addAttribute("세션이 만료되었습니다. 다시 시도해주세요.");
			return "redirect:/get/goods?gno="+tVo.getGno();
		}
	}

}
