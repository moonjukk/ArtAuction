package com.artauction.domain;

import lombok.Data;

@Data
public class ImageVO {

	private int gno;
	private String uuid;
	private String uploadpath;
	private String filename;
	private char thumbnail;

	private String selectedImg; // select태그 사용하기 위한 임시변수, db에는 존재하지않음
	
}
