package com.artauction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artauction.domain.Criteria;
import com.artauction.domain.PageDTO;
import com.artauction.service.ListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/")
@AllArgsConstructor							//생성자 자동생성
public class ListController {
	private ListService service;			//자동주입
	
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		model.addAttribute("list",service.getListWithPaging(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,service.getTotalCount(cri)));
		model.addAttribute("listCategory",service.getListCategory());
		model.addAttribute("category",service.getCategory(cri));
		
		log.info("카테고리" +service.getCategory(cri));
		
	}
}
