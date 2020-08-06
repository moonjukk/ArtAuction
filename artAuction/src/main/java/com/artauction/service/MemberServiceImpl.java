package com.artauction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artauction.domain.AdminSearchVO;
import com.artauction.domain.Alarm;
import com.artauction.domain.AuthVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.ReliabilityVO;
import com.artauction.domain.UserVO;
import com.artauction.domain.adminCriteria;
import com.artauction.domain.adminCriteria2;
import com.artauction.domain.adminGoodsVO;
import com.artauction.mapper.MemberMapper;
import com.artauction.mapper.RegisterMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	

	@Override
	public int idCheck(String userid) {
		return mapper.idCheck(userid);
	}

	@Override
	@Transactional
	public void userRegister(UserVO uVo) {
		// 회원정보 insert
		mapper.userRegister(uVo);
		
		// auth insert
		mapper.authRegister(uVo);
	}

	@Override
	public List<UserVO> getListWithPaging(adminCriteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalUser() {
		return mapper.getTotalUser();
	}

	@Override
	public List<UserVO> searchById(AdminSearchVO asVO) {
		if(asVO.getType().equals("byId")) {
			return mapper.searchById(asVO);
		}else {
			return mapper.searchByName(asVO);
		}
	}

	@Override
	public int searchByIdCount(AdminSearchVO asVO) {
		if(asVO.getType().equals("byId")) {
			return mapper.searchByIdCount(asVO);
		}else {
			return mapper.searchByNameCount(asVO);
		}
	}

	@Override
	public void modifyMemberByAdmin(UserVO uVo) {
		mapper.modifyMemberByAdmin(uVo);
	}

	@Override
	public List<adminGoodsVO> getGoodsListWithPaging(adminCriteria2 adminCri2) {
		return mapper.getGoodsListWithPaging(adminCri2);
	}

	@Override
	public int getTotalGoods() {
		return mapper.getTotalGoods();
	}

	@Override
	public void modifyGoodsByAdmin(GoodsVO gVo) {
		mapper.modifyGoodsByAdmin(gVo);
	}

	@Override
	public List<adminGoodsVO> searchGoodsById(AdminSearchVO asVO) {
		if(asVO.getType().equals("byId")) {
			return mapper.searchGoodsById(asVO);
		}else {
			return mapper.searchGoodsByName(asVO);
		} 
	}

	@Override
	@Transactional
	public void adminMemberAuth(AuthVO aVo) {
		if(aVo.getUserauth().equals("ROLE_ADMIN")) {
			// 1.등용 _ 이미 관리지인지 체크 _ 관리자 등용
			int i = mapper.checkAuth(aVo);
			if(i>0) {
				System.out.println("!!! "+aVo.getUserid()+"는 이미 관리자입니다");
			}else {
				mapper.giveAuth(aVo);
				System.out.println("!!! "+aVo.getUserid()+"를 관리자로 등용하였습니다.");
			}
			
		}else {
			// 2 해지 _ 관리자가 아닌사람인지 확인 _ 관리자 해지
			int i = mapper.checkAuth(aVo);
			System.out.println(i);
			if(i<1) {
				System.out.println("!!! "+aVo.getUserid()+"는 관리자가 아닙니다");
			}else {
				mapper.takeAwayAuth(aVo);
				System.out.println("!!! "+aVo.getUserid()+"를 관리자에서 해지하였습니다.");
			}
		}	
	}

	@Override
	@Transactional
	public void deleteGoodsByAdmin(GoodsVO gVo) {
		// 1. 이미지삭제
		mapper.removeImage(gVo);
		System.out.println("!!!! "+gVo.getGno()+"의 이미지정보 삭제");
		// 2. 경매참여 정보 삭제
		mapper.removeTrade(gVo);
		System.out.println("!!!! "+gVo.getGno()+"의 경매참여자정보 삭제");
		// 3. 물품정보 삭제
		mapper.removeGoods(gVo);
		System.out.println("!!!! "+gVo.getGno()+"의 물품정보 삭제");
	}

	@Override
	@Transactional
	public String findUserPw(UserVO uVo) {
		// 유저정보가 존재하는지 체크
		int check = mapper.checkRealUser(uVo);
		
		if(check==1) {
			// 유저정보가 존재한다면 -> tempPw로 pw를 변경해줘야함
			String tempPw = uVo.getTemppw();
			String realPw = pwencoder.encode(tempPw);
			uVo.setTemppw(realPw);
			mapper.changeTempPw(uVo);
			System.out.println("!! "+uVo.getUserid()+"의 임시비밀번호가 발급되었습니다.");
			return realPw;
		}else {
			// 유저정보가 존재하지않는다면 -> 다시 찾기 페이지로 돌아가야함
			return "no_user";
		}
	}

	@Override
	public String findUserId(UserVO uVo) {
		// 유저정보가 존재하는지 체크
		int check = mapper.checkRealUserByName(uVo);
		
		if(check>0) {
			String findId = mapper.findUserId(uVo).getUserid();
			return findId;
		}else {
			// 유저정보가 존재하지않는다면 -> 다시 찾기 페이지로 돌아가야함
			return "no_user";
		}
		
	}

	@Override
	public int getAlarm(String userid) {
		int checkMessage = mapper.getAlarm(userid);
		return checkMessage;
	}

	@Override
	public void removeAlarm(String userid) {
		int checking = mapper.getAlarm(userid);
		if(checking>0) {
			mapper.removeAlarm(userid);
		}
	}

	@Override
	public void reliabilityInput(String userid, String result) {
		if(result.equals("TRADE_TRY")) {
			mapper.reliabilityTry(userid);
		}else if(result.equals("TRADE_SUCCESS")) {
			mapper.reliabilitySuccess(userid);
		}else {
			mapper.reliabilityFail(userid);
		}
	}

	@Override
	public ReliabilityVO reliabilityGet(String userid) {
		ReliabilityVO rVo = mapper.reliabilityGet(userid);
		int trying = rVo.getTrying();
		int success = rVo.getSuccess();
		int fail = rVo.getFail();
		int total = success + fail;
		float rate = (float)success/total;
		rVo.setRate(rate);
		
		if(fail>=3 && rVo.getRate()<=0.5) {
			rVo.setRank("주의1");
		}else if(fail>=5 && rVo.getRate()<=0.5) {
			rVo.setRank("주의2");
		}else if(fail>=10 && rVo.getRate()<=0.4) {
			rVo.setRank("주의3");
		}else if(trying>=3 && success>1) {
			rVo.setRank("1");
		}else if(trying>=5 && success>3 && rate>0.6) {
			rVo.setRank("2");
		}else if(trying>=10 && success>6 && rate>0.6) {
			rVo.setRank("3");
		}else if(trying>=20 && success>12 && rate>0.6) {
			rVo.setRank("4");
		}else if(trying>=30 && success>18 && rate>0.6) {
			rVo.setRank("5");
		}else if(trying>=40 && success>24 && rate>0.6) {
			rVo.setRank("6");
		}else if(trying>=50 && success>30 && rate>0.6) {
			rVo.setRank("7");
		}else {
			rVo.setRank("0");
		}
		
		
		//return mapper.reliabilityGet(userid);
		return rVo;
	}

}
