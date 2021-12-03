package kr.or.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.resume.service.ResumeService;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumeTbl;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;
	
	@RequestMapping(value="/resumeFrm.do")
	public String resumeFrm(Model model, String requritTitle, int requritNo) {
		model.addAttribute("requritTitle",requritTitle);
		model.addAttribute("requritNo",requritNo);
		return "resume/resumeInsert";
	}
	@RequestMapping(value="/resumeInsert.do")
	public String resumeInsert(HttpSession session,Model model,Resume r,ResumeTbl rtbl) {
		return "resume/resumeInsert";
	}
	
}
