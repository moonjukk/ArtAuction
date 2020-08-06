package com.artauction.task;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.TradeVO;
import com.artauction.mapper.GetMapper;
import com.artauction.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Component
public class TradeCheckTask {

	@Setter(onMethod_= {@Autowired})
	private GetMapper mapper;

	@Setter(onMethod_= {@Autowired})
	private MemberMapper memberMapper;
	
	@Scheduled(cron="0 * * * * *")
	public void tradeSuccess()throws Exception{
		
			//낙찰자 없는경우 가져오기
			List<GoodsVO> failBidGoods = mapper.failBidGoods();
//			System.out.println("거래종료 됐으나 응찰자가 없는 상품들 :");
//			failBidGoods.forEach(a-> log.warn(a));
			
			//모든 goods 중에 거래종료되었으나 flag가 0인것만 가져오기 (응찰자는 있음)
			List<GoodsVO> successBidGoods = mapper.successBidGoods();
//			System.out.println("거래종료 됐으나 flag가 0인 상품들 :");
//			successBidGoods.forEach(b -> log.warn(b));

			System.out.println("============ 거래정보 확인중 ============");
			System.out.print("체크1 : "+successBidGoods.size());
			//System.out.println("1번 : "+successBidGoods);
			if(successBidGoods.size() !=0) {
				//tprice가 null이면 tradefail 에 넣기
				mapper.tradeSuccess(successBidGoods);
				System.out.println("! 경메데이터 update");
				for(int i=0; i<successBidGoods.size(); i++) {
					System.out.println(successBidGoods.get(i));
					
					String a = successBidGoods.get(i).getRegisteruserid();
					String b = successBidGoods.get(i).getBuyinguserid();
					System.out.println(a);
					System.out.println(b);
					if(a!=null) { 
						memberMapper.setAlarm(a); 
						System.out.println(a+"에게 알람"); 
					}
					if(b!=null) {
						memberMapper.setAlarm(b);
						System.out.println(b+"에게 알람");
					}
				}
			}
			
			
			System.out.println(" / 체크2 : "+failBidGoods.size());
			//System.out.println("2번 : "+failBidGoods);
			if(failBidGoods.size() !=0) {
				//낙찰된 경우
				mapper.tradeFail(failBidGoods);
				System.out.println("!! 경메데이터 update");
				for(int i=0; i<successBidGoods.size(); i++) {
					System.out.println(successBidGoods.get(i));
					
					String a = successBidGoods.get(i).getRegisteruserid();
					System.out.println(a);
					if(a!=null) { 
						memberMapper.setAlarm(a); 
						System.out.println(a+"에게 알람"); 
					}
				}
			}
	}
	
	
}