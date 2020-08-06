package com.artauction.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class adminCriteria {
	private int pageNum;
	private int amount = 10;
	
	public adminCriteria() {
		this(1);
	}
	
	public adminCriteria(int pageNum) {
		this.pageNum = pageNum;
	}

}
