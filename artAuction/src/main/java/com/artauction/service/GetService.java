package com.artauction.service;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.InquireVO;
import com.artauction.domain.TradeVO;

public interface GetService {

		//getPage �씫湲�
		public GoodsVO read(int gno);
		
		//�엯李곗옄 �닔 援ы븯湲�
		public int countBidder(int gno);
		
		//get page�쓽 �쁽�옱 理쒓퀬媛�(?) �엯李곗옄 援ы븯湲�
		public String highBidder(int gno);
		
		//�떆�옉�떆媛�(startDate)援ы븯湲�
		public String startTime(int gno);
		
		//醫낅즺�떆媛� (endDate)援ы븯湲�
		public String endTime(int gno);
		
		//�쓳李고븯湲�(modal�뿉�꽌 �쓳李곕쾭�듉 �겢由� �떆)
		public void bidPriceInsert (TradeVO tVo);
		
		//�뜽�꽕�씪 �씠誘몄� 媛��졇�삤湲�
		public List<ImageVO> findImg(int gno);
		
		//�뜽�꽕�씪 �젣�쇅�븳 �씠誘몄� 媛��졇�삤湲�
		public ImageVO thumbnailImg(int gno);
		
		//�벑濡앸맂 �씠誘몄� 媛��닔
		public int cntImg(int gno);
		
		
		// get페이지 내 문의하기
		public void inquireInput(InquireVO iVo);
		// get페이지 내 문의 답변하기
		public void inquireReply(InquireVO iVo);
		// get페이지 내 문의하기 리스트 get
		public List<InquireVO> inquireOutput(int gno);
		
		// 즉시구매하기
		public int nowBuy(TradeVO tVo);
		
		// 카테고리명 get
		public String getCategoryName(int categoryid);
}
