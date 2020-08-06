package com.artauction.service;

import java.util.List;

import com.artauction.domain.CategoryVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.ListVO;
import com.artauction.domain.UserVO;

public interface ListService {
	public UserVO read(String userId);
	
	public List<ListVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<CategoryVO> getListCategory();
	
	public CategoryVO getCategory(Criteria cri);
	
	public List<ListVO> getRecommend(Criteria cri);
}
