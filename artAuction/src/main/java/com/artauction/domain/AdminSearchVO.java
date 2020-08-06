package com.artauction.domain;

import lombok.Data;

@Data
public class AdminSearchVO {

	private String type;
	private String query;

	private String beforeURL;
	
}
