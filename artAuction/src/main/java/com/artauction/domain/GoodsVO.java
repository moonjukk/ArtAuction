package com.artauction.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {

	private int gno;
	private int categoryid;
	private String registeruserid;
	private String gname;
	private int startprice;
	private int divisionprice;
	private int endprice;
	private String ginfo;
	private Date startdate;
	private Date enddate;
	private char flag;
	private String buyinguserid;
	private int tradeprice;
	
	private List<ImageVO> imagelist;
	
}
