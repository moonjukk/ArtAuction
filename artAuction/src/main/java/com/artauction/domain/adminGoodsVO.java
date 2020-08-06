package com.artauction.domain;

import java.util.Date;

import lombok.Data;

@Data
public class adminGoodsVO {
	private int gno;
	private String gname;
	
	private char thumbnail;
	private String uploadpath;
	private String filename;
	private String uuid;
	
	private String registeruserid;
	private Date enddate;
	private char flag;
	private String buyinguserid;
}