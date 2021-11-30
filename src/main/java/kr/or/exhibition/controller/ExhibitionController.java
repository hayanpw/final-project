package kr.or.exhibition.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.exhibition.service.ExhibitionService;

@Controller
public class ExhibitionController {
	@Autowired
	private ExhibitionService service;
	
	@RequestMapping(value="/exhibitionFrm.do")
	public String exhibitionFrm() {
		return "exhibition/exhibitionInsert";
	}
	
}
