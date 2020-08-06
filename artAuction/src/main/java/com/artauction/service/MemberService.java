package com.artauction.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artauction.domain.AdminSearchVO;
import com.artauction.domain.AuthVO;
import com.artauction.domain.Criteria;
import com.artauction.domain.GoodsVO;
import com.artauction.domain.ReliabilityVO;
import com.artauction.domain.UserVO;
import com.artauction.domain.adminCriteria;
import com.artauction.domain.adminCriteria2;
import com.artauction.domain.adminGoodsVO;

public interface MemberService {
	
	// id 중복체크
	public int idCheck(String userid);
	
	// 회원가입
	public void userRegister(UserVO uVo);
	
	// admin전용 _ user정보 
	public List<UserVO> getListWithPaging(adminCriteria cri);
	
	// 총 몇명인지 조회
	public int getTotalUser();
	
	// admin_아이디 혹은 이름으로 검색
	public List<UserVO> searchById(AdminSearchVO asVO);

	// 아이디 혹은 이름으로 검색한 총 결과 수
	public int searchByIdCount(AdminSearchVO asVO);
	
	// 관리자페이지에서 유저정보 수정
	public void modifyMemberByAdmin(UserVO uVo);
	
	// 관리자페이지에서 상품정보 get
	public List<adminGoodsVO> getGoodsListWithPaging(adminCriteria2 adminCri);
	
	// 총 몇개의 상품인지
	public int getTotalGoods();
	
	// 관리자페이지에서 물품정보 수정
	public void modifyGoodsByAdmin(GoodsVO gVo);
	
	// admin_아이디 혹은 물품명으로 검색
	public List<adminGoodsVO> searchGoodsById(AdminSearchVO asVO);
	
	// admin_회원을 관리자로 등용/해지
	public void adminMemberAuth(AuthVO aVo);
	
	// admin_경매 강제삭제
	public void deleteGoodsByAdmin(GoodsVO gVo);
	
	// pw찾기
	public String findUserPw(UserVO uVo);

	// id찾기
	public String findUserId(UserVO uVo);
	
	// 알람메시지 관련 메소드
	public int getAlarm(String userid);
	public void removeAlarm(String userid);
	
	// 신용도 input
	public void reliabilityInput(String userid, String result);
	// 신용도 select
	public ReliabilityVO reliabilityGet(@Param("userid") String userid);
}
