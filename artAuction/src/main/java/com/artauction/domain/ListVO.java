package com.artauction.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ListVO {
	private int gno;
	private int categoryid;
	private String registeruserid;
	private String gname;
	private int startprice;
	private Date startdate;
	private Date enddate;
	private char flag;
	private String uploadpath;
	private String filename;
	private String uuid;
	private char thumbnail;
	private int nowprice;
}