package com.artauction.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String userid;
	private String pw;
	private String username;
	private String userphonenum;
	private String bankaccount;
	private String bankname;
	
	// 1이면 사용가능한 계정 0이면 불가능한 계정
	private char enabled;
	
	//시큐리티에서 사용할 권한 list
	private List<AuthVO> authList;
	
	// pw찾기에서 사용할 임시 패스워드
	private String temppw;
}
