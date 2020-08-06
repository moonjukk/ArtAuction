package com.artauction.domain;

import lombok.Data;

@Data
public class ReliabilityVO {

	private String tno;
	private String userid;
	private String result;
	
	// 거래 등록횟수(판매)
	private int trying;
	// 거래 성공횟수
	private int success;
	// 거래 실패횟수
	private int fail;
	// (성공/성공+실패) 비율
	private float rate;
	// rank
	private String rank;
	
	
}
