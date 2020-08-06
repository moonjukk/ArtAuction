package com.artauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.MypageBuyingVO;
import com.artauction.domain.MypageVO;
import com.artauction.domain.UserVO;
import com.artauction.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Setter(onMethod_=@Autowired)
	private MyPageMapper mapper;

	

	//응찰현황 불러오기
	@Override
	public List<MypageVO> userTradeGoodsInfo(String userid) {
		log.info("userTradeGoodsInfo list");
		return mapper.userTradeGoodsInfo(userid);
	}

//////////구매현황
	
	
//	전체 구매현황 List
	@Override
	public List<MypageBuyingVO> userBuyingGoodsInfo(String buyinguserid) {
		
		return mapper.userBuyingGoodsInfo(buyinguserid);
	}
//	구매 입금대기 List
	@Override
	public List<MypageBuyingVO> buyWait(String registeruserid) {
		return mapper.buyWait(registeruserid);
	}
//	구매 거래중 List
	@Override
	public List<MypageBuyingVO> buyTrading(String registeruserid) {
		return mapper.buyTrading(registeruserid);
	}
//	구매 거래완료 List
	@Override
	public List<MypageBuyingVO> buySuccess(String registeruserid) {
		return mapper.buySuccess(registeruserid);
	}
//	구매 거래취소 List
	@Override
	public List<MypageBuyingVO> buyCancel(String registeruserid) {
		return mapper.buyCancel(registeruserid);
	}
	
//	입금대기 count
	@Override
	public int buyWaitCount(String buyinguserid) {
		return mapper.buyWaitCount(buyinguserid);
	}

//	거래중 count
	@Override
	public int buyTradingCount(String buyinguserid) {
		return mapper.buyTradingCount(buyinguserid);
	}

//	거래완료 count
	@Override
	public int buysuccessCount(String buyinguserid) {
		return mapper.buysuccessCount(buyinguserid);
	}

//	거래취소 count
	@Override
	public int buyCancelCount(String buyinguserid) {
		return mapper.buyCancelCount(buyinguserid);
	}


//////////판매현황	
	
//	전체 판매현황 List
	@Override
	public List<MypageBuyingVO> userSellGoodsInfo(String registeruserid) {
		return mapper.userSellGoodsInfo(registeruserid);
	}
//	판매 중인 List
	@Override
	public List<MypageBuyingVO> selling(String registeruserid) {
		return mapper.selling(registeruserid);
	}
//	판매 입금 대기중인 List
	@Override
	public List<MypageBuyingVO> sellWait(String registeruserid) {
		return mapper.sellWait(registeruserid);
	}
//	판매 거래중인 List
	@Override
	public List<MypageBuyingVO> sellTrading(String registeruserid) {
		return mapper.sellTrading(registeruserid);
	}
//	판매 거래완료한 List
	@Override
	public List<MypageBuyingVO> sellSuccess(String registeruserid) {
		return mapper.sellSuccess(registeruserid);
	}
//	판매 거래취소한 List
	@Override
	public List<MypageBuyingVO> sellCancel(String registeruserid) {
		return mapper.sellCancel(registeruserid);
	}
//	판매 유찰된 List
	@Override
	public List<MypageBuyingVO> sellFail(String registeruserid) {
		return mapper.sellFail(registeruserid);
	}
	
//	판매중인 상품 count
	@Override
	public int sellingCount(String registeruserid) {
		return mapper.sellingCount(registeruserid);
	}
	
//	판매 입금대기 count
	@Override
	public int sellWaitCount(String registeruserid) {
		return mapper.sellWaitCount(registeruserid);
	}

//	판매 거래중 count
	@Override
	public int sellTradingCount(String registeruserid) {
		return mapper.sellTradingCount(registeruserid);
	}

//	판매 거래완료 count
	@Override
	public int sellSuccessCount(String registeruserid) {
		return mapper.sellSuccessCount(registeruserid);
	}

//	판매 거래취소 count
	@Override
	public int sellCancelCount(String registeruserid) {
		return mapper.sellCancelCount(registeruserid);
	}

//	판매 거래유찰 count
	@Override
	public int sellFailCount(String registeruserid) {
		return mapper.sellFailCount(registeruserid);
	}

	// ///////////////////////////////////////////////
	// 회원정보 수정									//
	// ///////////////////////////////////////////////
			
//	user의 정보 불러오기
	@Override
	public UserVO info(String userid) {
		return mapper.info(userid);
	}

//	user 정보수정
	@Override
	public void updateInfo(UserVO uVo) {
		mapper.updateInfo(uVo);
		
	}

	



}
