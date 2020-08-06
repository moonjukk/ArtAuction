package com.artauction.domain;

import java.util.Date;

import lombok.Data;

//구매현황, 판매현황 둘다 사용됨
@Data
public class MypageBuyingVO {

	private int gno;
	private int categoryid;
	private String registeruserid;
	private String gname;
	private int nowprice;
	private int startprice;
	private Date startdate;
	private Date enddate;
	private char flag;
	private String buyinguserid;
	private int tradeprice;
	private char thumbnail;
	private String filename;
	private String uuid;
	private String uploadpath;
	
	
	
}
