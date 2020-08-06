package com.artauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.UserVO;
import com.artauction.mapper.DealMapper;
import com.artauction.mapper.RegisterMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@Service
public class DealServiceImpl implements DealService {
	
	@Setter(onMethod_ = @Autowired)
	private DealMapper mapper;

	@Override
	public GoodsVO findByGno(int gno) {
		return mapper.findByGno(gno);
	}

	@Override
	public String getStartTime(int gno) {
		return mapper.getStartTime(gno);
	}

	@Override
	public String getEndTime(int gno) {
		return mapper.getEndTime(gno);
	}

	@Override
	public int getBiddingCount(int gno) {
		return mapper.getBiddingCount(gno);
	}

	@Override
	public UserVO getSalerInfo(int gno) {
		return mapper.getSalerInfo(gno);
	}

	@Override
	public UserVO getBuyerInfo(int gno) {
		return mapper.getBuyerInfo(gno);
	}

	@Override
	public ImageVO findThumbImageByGno(int gno) {
		return mapper.findThumbImageByGno(gno);
	}

	@Override
	public List<ImageVO> findImageByGno(int gno) {
		return mapper.findImageByGno(gno);
	}

	@Override
	public int cntImg(int gno) {
		return mapper.cntImg(gno);
	}

	@Override
	public void updateFlag(GoodsVO gVo) {
		mapper.updateFlag(gVo);
	}
	
	

}
