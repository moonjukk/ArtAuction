package com.artauction.mapper;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.UserVO;

public interface DealMapper {
	
	public GoodsVO findByGno(int gno);
	
	//시작시간(startDate)구하기
	public String getStartTime(int gno);
	
	//종료시간 (endDate)구하기
	public String getEndTime(int gno);
	
	public int getBiddingCount(int gno);
	
	public UserVO getSalerInfo(int gno);
	
	public UserVO getBuyerInfo(int gno);
	
	public ImageVO findThumbImageByGno(int gno);
	
	public List<ImageVO> findImageByGno(int gno);
	
	public int cntImg(int gno);
	
	// 거래상태(flag) 업데이트
	public void updateFlag(GoodsVO gVo);
}
