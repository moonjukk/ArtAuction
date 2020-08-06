package com.artauction.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquireVO {

	private long rno;
	private long gno;
	
	private String replyerid;
	private String reply;
	private Date replydate;
	
	private long parentno;
	private int depth;
	
}
