package kr.or.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.resume.service.ResumeService;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;
	
	@RequestMapping(value="/resumeFrm.do")
	public String resumeInsert() {
		return "resume/resumeInsert";
	}
	
}
