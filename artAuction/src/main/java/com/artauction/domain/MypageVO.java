package com.artauction.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MypageVO {

	private int gno;
	private String gname;
	private Date enddate;
	private char flag;
	private int nowprice;
	private String userid;
	private int tprice;
	private String uuid;
	private String uploadpath;
	private String filename;
}
