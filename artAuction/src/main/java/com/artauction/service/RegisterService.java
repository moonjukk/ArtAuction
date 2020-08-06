package com.artauction.service;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.ListVO;
import com.artauction.domain.UserVO;

public interface RegisterService {
	
	public void insert(GoodsVO gVo);
	
	public List<ImageVO> findImageByGno(int gno);
	
	public void checkUserAccount(UserVO uVo);
	
	// main화면에서 추천 리스트
	public List<ListVO> recommandList();
	
	// 유저의 정보에 계좌정보가있으면 get
	public UserVO getUserAccount(UserVO uVo);
}
