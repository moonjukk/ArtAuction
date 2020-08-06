package com.artauction.mapper;

import java.util.List;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.ListVO;
import com.artauction.domain.UserVO;

public interface RegisterMapper {
	
	public void insert(GoodsVO gVo);
	
	public void imageInsert(ImageVO iVo);
	
	public List<ImageVO> findImageByGno(int gno);
	
	// 1일전 목록을 확인해서 db에 존재하지않는 파일 삭제 
	public List<ImageVO> getOldFiles();
	
	public int checkUserAccount(UserVO uVo);
	
	public void updateUserAccount(UserVO uVo);
	
	// main화면에서 추천 리스트
	public List<ListVO> recommandList();
	
	// 유저정보에 계좌정보가 있으면 get
	public UserVO getUserAccount(UserVO uVo);
}
