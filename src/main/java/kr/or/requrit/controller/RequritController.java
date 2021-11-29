package kr.or.requrit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.requrit.service.RequritService;


@Controller
public class RequritController {
	@Autowired
	private RequritService service;
	
	@RequestMapping(value="/requritFrm.do")
	public String resumerFrm() {
		return "requrit/requritInsert";
	}
}
