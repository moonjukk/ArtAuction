package com.artauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artauction.domain.CategoryVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.ListVO;
import com.artauction.domain.UserVO;
import com.artauction.mapper.ListMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@Service
public class ListServiceImpl implements ListService {
	
	@Setter(onMethod_=@Autowired)
	private ListMapper mapper;
	
	@Override
	public UserVO read(String userId) {
		
		return mapper.read(userId);
	}

	
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<CategoryVO> getListCategory() {
		return mapper.getListCategory();
	}


	@Override
	public List<ListVO> getListWithPaging(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}


	@Override
	public CategoryVO getCategory(Criteria cri) {
		return mapper.getCategory(cri);
	}


	@Override
	public List<ListVO> getRecommend(Criteria cri) {
		return mapper.getRecommend(cri);
	}



	

}
