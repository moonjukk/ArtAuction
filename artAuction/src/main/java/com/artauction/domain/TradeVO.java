package com.artauction.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TradeVO {

	private int gno;
	private String userid;
	private Date tdate;
	private int tprice;
	
}
