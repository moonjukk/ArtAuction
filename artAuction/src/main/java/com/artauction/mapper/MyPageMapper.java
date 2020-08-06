package com.artauction.mapper;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.MypageBuyingVO;
import com.artauction.domain.MypageVO;
import com.artauction.domain.UserVO;

public interface MyPageMapper {

//	입찰내역 List
	public List<MypageVO> userTradeGoodsInfo(String userid);
	
//	전체 구매현황 List
	public List<MypageBuyingVO> userBuyingGoodsInfo(String buyinguserid);
	
//	구매 입금대기 List
	public List<MypageBuyingVO> buyWait(String registeruserid);
	
//	구매 거래중 List
	public List<MypageBuyingVO> buyTrading(String registeruserid);
	
//	구매 거래완료 List
	public List<MypageBuyingVO> buySuccess(String registeruserid);
	
//	구매 거래취소 List
	public List<MypageBuyingVO> buyCancel(String registeruserid);
	
//	구매 입금대기 count
	public int buyWaitCount(String buyinguserid);
//	구매 거래중 count
	public int buyTradingCount(String buyinguserid);
//	구매 거래완료 count
	public int buysuccessCount(String buyinguserid);
//	구매 거래취소 count
	public int buyCancelCount(String buyinguserid);
	
	
//	////////////////////////////////////////////////////
	
	
//	전체 판매현황 List
	public List<MypageBuyingVO> userSellGoodsInfo(String registeruserid);
	
//	판매 중인 List
	public List<MypageBuyingVO> selling(String registeruserid);
	
//	판매 입금 대기중인 List
	public List<MypageBuyingVO> sellWait(String registeruserid);
	
//	판매 거래중인 List
	public List<MypageBuyingVO> sellTrading(String registeruserid);
	
//	판매 거래완료한 List
	public List<MypageBuyingVO> sellSuccess(String registeruserid);
	
//	판매 거래취소한 List
	public List<MypageBuyingVO> sellCancel(String registeruserid);
	
//	판매 유찰된 List
	public List<MypageBuyingVO> sellFail(String registeruserid);
	
//	판매중인 상품 count
	public int sellingCount(String registeruserid);
//	판매 입금대기 count
	public int sellWaitCount(String registeruserid);
//	판매 거래중 count
	public int sellTradingCount(String registeruserid);
//	판매 거래완료 count
	public int sellSuccessCount(String registeruserid);
//	판매 거래취소 count
	public int sellCancelCount(String registeruserid);
//	판매 거래유찰 count
	public int sellFailCount(String registeruserid);
	
	
// ///////////////////////////////////////////////
// 회원정보 수정									//
// ///////////////////////////////////////////////
	
//	user의 정보 불러오기
	public UserVO info(String userid);
	
//	user정보 수정
	public void updateInfo(UserVO uVo);

}
