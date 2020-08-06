package com.artauction.service;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.UserVO;

public interface DealService {
	
	public GoodsVO findByGno(int gno);
	
	//시작시간(startDate)구하기
	public String getStartTime(int gno);
			
	//종료시간 (endDate)구하기
	public String getEndTime(int gno);
	
	//경매참여자수 get
	public int getBiddingCount(int gno);
	
	//판매자 개인정보
	public UserVO getSalerInfo(int gno);

	//구매자 개인정보
	public UserVO getBuyerInfo(int gno);
	
	//대표 이미지 get
	public ImageVO findThumbImageByGno(int gno);
	
	//이미지 갯수 get
	public int cntImg(int gno);
	
	public List<ImageVO> findImageByGno(int gno);
	
	// 거래상태(flag) 업데이트
	public void updateFlag(GoodsVO gVo);
}
