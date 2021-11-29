package kr.or.addition.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardPageData;

@Controller
public class AdditionController {
	@Autowired
	private AdditionService service;
	
	@RequestMapping(value = "/addition.do")
	public String addition() {
		return "addition/addition";
	}
	@RequestMapping(value = "/additionNotice.do")
	public String notice(int boardType,int reqPage,Model model) {
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return "addition/notice";
	}
	
	@RequestMapping(value = "/additionQNA.do") 
	public String qna(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/qna"; 
	 }
	 
	@RequestMapping(value = "/additionFree.do") 
	public String free(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/free"; 
	 }
	 
}
