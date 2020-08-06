package com.artauction.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.InquireVO;
import com.artauction.domain.TradeVO;
import com.artauction.mapper.GetMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Service
public class GetServiceImpl implements GetService {
	
	@Setter(onMethod_=@Autowired)
	private GetMapper mapper;
	
	
//	gno 踰덊샇濡� �긽�뭹�젙蹂� 湲곸뼱�삤湲�
	@Override
	public GoodsVO read(int gno) {
		
		return mapper.read(gno);
	}

	//get page�쓽 �엯李곗옄 �닔 援ы븯湲�
	@Override
	public int countBidder(int gno) {
		
		return mapper.countBidder(gno);
	}
	
	//get page�쓽 �쁽�옱 理쒓퀬媛�(?) �엯李곗옄 援ы븯湲�
	@Override
	public String highBidder(int gno) {
		
		return  mapper.highBidder(gno);
	}

	//�엯李� �떆�옉�씪 援ы븯湲�
	@Override
	public String startTime(int gno) {
		
		return mapper.startTime(gno);
	}

	//�엯李� 醫낅즺�씪 援ы븯湲�
	@Override
	public String endTime(int gno) {

		return mapper.endTime(gno);
	}

	
	
	//�쓳李고븯湲� (modal�뿉�꽌 �쓳李곕쾭�듉 �겢由� �떆. 媛�寃⑹씠 �씪移섑븳吏�瑜� �뿬湲곗꽌 鍮꾧탳 �썑 insert�븷 �븣 1000�썝 �뜑�빐�꽌 �꽔�뼱以섏빞 �븿.)

	@Transactional
	   @Override
	   public void bidPriceInsert(TradeVO tVo) {
	      
	      System.out.println("impl濡� �꽆�뼱�삤�굹...!");
	      
	      //�쁽�옱 理쒓퀬 �엯李곗븸�쓣 nowBidPrice�씪怨� �븯怨�, if臾몄뿉�꽌 臾몄젣媛� �뾾�쓣 寃쎌슦 �뿬湲곗꽌 1000�썝�쓣 �뜑�빐 �쓳李�.
	      int nowBidPrice = tVo.getTprice();
	      System.out.println("�쁽�옱 理쒓퀬 �엯李곌�: "+nowBidPrice);
	      
	      //int�뒗 null�쓣 �씤�떇�븯吏� 紐삵빐�꽌 Integer濡� �꽑�뼵.
	      //�쁽�옱 �엯李고븳 �궡�뿭�씠 �뾾�쓣 寃쎌슦 bidpricecheck瑜� 0�쑝濡� 諛붽퓭二쇨린.
	      Integer bidPriceCheck = mapper.bidPriceCheck(tVo.getGno());
	      if (bidPriceCheck == null) {
	         bidPriceCheck = 0;
	      }
	      //DB�뿉 ���옣�맂 媛�寃⑷낵 �쁽�옱 媛�寃⑹씠 媛숈쑝硫� 洹멸컪�뿉 1000�썝�쓣 �뜑�빐�꽌 �엯�젰�븯�뒗寃껋쑝濡�
	      System.out.println("8469ㅎ:" + tVo);
	      mapper.bidPriceInsert(tVo);
	      if (nowBidPrice != bidPriceCheck) {
	         System.out.println("back!!");
	         return;
	      }
	      
	 }

	//�씠誘몄� 媛��졇�삤湲�
	@Override
	public List<ImageVO> findImg(int gno) {
		return mapper.findImg(gno);
	}

	//�뜽�꽕�씪 �씠誘몄� 媛��졇�삤湲�
	@Override
	public ImageVO thumbnailImg(int gno) {
		return mapper.thumbnailImg(gno);
	}

	//�씠誘몄� 移댁슫�듃�븯湲�
	@Override
	public int cntImg(int gno) {
		return mapper.cntImg(gno);
	}
	
	// get 페이지 내 문의하기
	@Override
	public void inquireInput(InquireVO iVo) {
		mapper.inquireInput(iVo);
	}

	@Override
	public List<InquireVO> inquireOutput(int gno) {
		return mapper.inquireOutput(gno);
	}

	@Override
	public void inquireReply(InquireVO iVo) {
		mapper.inquireReply(iVo);
	}

	// 즉시구매하기
	@Override
	@Transactional
	public int nowBuy(TradeVO tVo) {
		// TradeVO(gno=101, userid=moon, tdate=null, tprice=120000)
		// flag 확인 -> 1이면 true
		int checkFlag = mapper.checkFlag(tVo);
		if(checkFlag==1) {
			// update
			mapper.nowBuy(tVo);
			return 1;
		}else {
			return 0;
		}
		
		
		
	}
	
	// 카테고리명 구하기
	@Override
	public String getCategoryName(int categoryid) {
		return mapper.getCategoryName(categoryid);
	}
	
}
