package com.artauction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.InquireVO;
import com.artauction.domain.TradeVO;

public interface GetMapper {

	//getPage �씫湲�
	public GoodsVO read(int gno);
	
	//�엯李곗옄 �닔 援ы븯湲�
	public int countBidder(int gno);
	
	//�쁽�옱 理쒓퀬媛�(?) �엯李곗옄 援ы븯湲�
	public String highBidder(int gno);
	
	//	�떆�옉�떆媛�(startDate)援ы븯湲�
	public String startTime(int gno);
	
	//醫낅즺�떆媛� (endDate)援ы븯湲�
	public String endTime(int gno);

	//�쓳李고븯湲� (modal�뿉�꽌 �쓳李곕쾭�듉 �겢由� �떆)
	public void bidPriceInsert(TradeVO tVo);
	
	//�쓳李고븯�젮�뒗 媛�寃⑷낵 �룞�씪�븳 媛�寃⑹씠 �엳�뒗吏� �솗�씤!!
	public Integer bidPriceCheck(int gno);

	
	//�뜽�꽕�씪 �씠誘몄� 媛��졇�삤湲�
	public List<ImageVO> findImg(int gno);
	
	//�뜽�꽕�씪 �젣�쇅�븳 �씠誘몄� 媛��졇�삤湲�
	public ImageVO thumbnailImg(int gno);
	
	//등록된 이미지 갯수
	public int cntImg(int gno);
	
	//모든 goods 중에 거래종료되었으나 flag가 0인것만 가져오기 
	public List<GoodsVO> successBidGoods();
	
	//낙찰자가 없는 경우는 (flag=0인 경우)
	public List<GoodsVO> failBidGoods();
	
	//낙찰자가 없는 경우는 거래취소 (flag: d)로 업데이트 하기 
	public void tradeFail(List<GoodsVO> list);
	
	//낙찰자 있는경우 flag, 낙찰자명, 낙찰금액 업데이트하기
	public void tradeSuccess(List<GoodsVO> list);
	
	// get페이지 내 문의하기
	public void inquireInput(InquireVO iVo);
	public void inquireReply(InquireVO iVo);
	public List<InquireVO> inquireOutput(int gno);
	
	// 즉시구매 관련 메소드
	public int checkFlag(TradeVO tVo);
	public void nowBuy(TradeVO tVo);
	
	// 카테고리 이름 구하기
	public String getCategoryName(@Param("categoryid") int categoryid);
	
}