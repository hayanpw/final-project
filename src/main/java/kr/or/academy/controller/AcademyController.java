package kr.or.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.academy.service.AcademyService;

@Controller
public class AcademyController {
	@Autowired
	private AcademyService service;
	
	@RequestMapping(value="/academyFrm.do")
	public String academyFrm() {
		return "academy/academyInsert";
	}
}
