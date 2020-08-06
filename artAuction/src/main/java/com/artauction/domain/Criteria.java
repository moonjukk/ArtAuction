package com.artauction.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int categoryid;
	private int pageNum;
	private int amount;
	private String type;
	private String searchList;
	private String keyword;
	
	public Criteria() {
		this(0,1,10, "");
	}
	
	public Criteria(int categoryid, int pageNum,int amount, String type) {
		this.categoryid = categoryid;
		this.pageNum = pageNum;
		this.amount = amount;
		this.type = type;
	}

}
