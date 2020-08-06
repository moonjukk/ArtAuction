package com.artauction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artauction.domain.AdminSearchVO;
import com.artauction.domain.AuthVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.GoodsVO;
import com.artauction.domain.ImageVO;
import com.artauction.domain.ReliabilityVO;
import com.artauction.domain.UserVO;
import com.artauction.domain.adminCriteria;
import com.artauction.domain.adminCriteria2;
import com.artauction.domain.adminGoodsVO;

public interface MemberMapper {

	// id 중복체크
	public int idCheck(String userid);
	
	// 회원가입
	public void userRegister(UserVO uVo);
	
	// auth 주입
	public void authRegister(UserVO uVo);
	
	// admin전용 _ 유저정보 get
	public List<UserVO> getListWithPaging(adminCriteria cri);
	
	public int getTotalUser();
	
	public List<UserVO> searchById(AdminSearchVO asVO);
	public List<UserVO> searchByName(AdminSearchVO asVO);
	
	public int searchByIdCount(AdminSearchVO asVO);
	public int searchByNameCount(AdminSearchVO asVO);
	
	// admin전용 _ 유저정보 수정
	public void modifyMemberByAdmin(UserVO uVo);
	
	// admin전용 _ 물품정보 리스트 get
	public List<adminGoodsVO> getGoodsListWithPaging(adminCriteria2 adminCri2);
	
	public int getTotalGoods();
	
	//admin전용 _ 물품정보 update
	public void modifyGoodsByAdmin(GoodsVO gVo);
	
	//admin전용 _ 물품정보 search
	public List<adminGoodsVO> searchGoodsById(AdminSearchVO asVO);
	public List<adminGoodsVO> searchGoodsByName(AdminSearchVO asVO);
	
	// admin전용 _ 관리자권한수정 
	// 관리자인지 체크
	public int checkAuth(AuthVO aVo);
	// 관리자 권한부여
	public void giveAuth(AuthVO aVo);
	// 관리자 권한해지
	public void takeAwayAuth(AuthVO aVo);
	
	// admin전용_물품정보삭제
	public void removeImage(GoodsVO gVo);
	public void removeTrade(GoodsVO gVo);
	public void removeGoods(GoodsVO gVo);
	
	// pw찾기 이전에 정말 회원이 맞는지 확인
	public int checkRealUser(UserVO uVo);
	// id찾기 이전에 정말 회원이 맞는지 확인
	public int checkRealUserByName(UserVO uVo);
	
	// 임시 pw 부여
	public void changeTempPw(UserVO uVo);
	// id찾기
	public UserVO findUserId(UserVO uVo);
	
	// 알람 get
	public int getAlarm(@Param("userid") String userid);
	public void setAlarm(@Param("userid") String userid);
	public void removeAlarm(@Param("userid") String userid);
	
	// 신용도테이블
	public void reliabilityTry(@Param("userid") String userid);
	public void reliabilitySuccess(@Param("userid") String userid);
	public void reliabilityFail(@Param("userid") String userid);
	public ReliabilityVO reliabilityGet(@Param("userid") String userid);
}
