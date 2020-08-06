package com.artauction.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class adminCriteria2 {
	
	/*
	 * adminGoods에서만 사용할 독립적인 criteria
	 * */
	
	private int pageNum;
	private int amount = 7;
	
	public adminCriteria2() {
		this(1);
	}
	
	public adminCriteria2(int pageNum) {
		this.pageNum = pageNum;
	}

}
