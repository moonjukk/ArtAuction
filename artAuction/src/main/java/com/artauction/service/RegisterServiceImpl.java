package com.artauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.ListVO;
import com.artauction.domain.UserVO;
import com.artauction.mapper.RegisterMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Setter(onMethod_ = @Autowired)
	private RegisterMapper mapper;
	
	@Transactional
	@Override
	public void insert(GoodsVO gVo) {
		//mapper.insertSelectKey(gVo);
		mapper.insert(gVo);
		
		if(gVo.getImagelist() == null || gVo.getImagelist().size()<=0) {
			return;
		}
		
		gVo.getImagelist().forEach(attach -> {
			attach.setGno(gVo.getGno());
			mapper.imageInsert(attach);
		});
	}

	@Override
	public List<ImageVO> findImageByGno(int gNo) {
		return mapper.findImageByGno(gNo);
	}

	@Override
	public void checkUserAccount(UserVO uVo) {
		System.out.println("1111111111111111111111111");
		int check = mapper.checkUserAccount(uVo);
		System.out.println("2222222222222222222222222");
		//만일 db에 등록된 계좌와 동일하지않다면
		if(check<1) {
			mapper.updateUserAccount(uVo);
			System.out.println("!!! 계좌정보 update...");
		}
	}

	@Override
	public List<ListVO> recommandList() {
		return mapper.recommandList();
	}

	@Override
	@Transactional
	public UserVO getUserAccount(UserVO uVo) {
		// 유저정보에 계좌정보가 있는지 확인
		String userid = uVo.getUserid();
		uVo = mapper.getUserAccount(uVo);
		if(uVo == null) {
			System.out.println("회원의 계좌정보가 존재하지않습니다");
			UserVO newuVo = new UserVO();
			newuVo.setUserid(userid);
			System.out.println(newuVo);
			return newuVo;
		}else {
			uVo.setUserid(userid);
			System.out.println(uVo);
			return uVo;	
		}
	}

}
