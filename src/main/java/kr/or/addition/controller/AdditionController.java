package kr.or.addition.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;

@Controller
public class AdditionController {
	@Autowired
	private AdditionService service;
	
	@RequestMapping(value = "/addition.do")
	public String addition() {
		return "addition/addition";
	}
	@RequestMapping(value = "/additionNotice.do")
	public String notice(int boardType,Model model) {
		ArrayList<Board> list= service.selectNoticeList(boardType);
		model.addAttribute("list",list);
		return "addition/notice";
	}
	@RequestMapping(value = "/additionQNA.do")
	public String qna(int boardType,Model model) {
		ArrayList<Board> list= service.selectNoticeList(boardType);
		model.addAttribute("list",list);
		return "addition/qna";
	}
	@RequestMapping(value = "/additionFree.do")
	public String free(int boardType,Model model) {
		ArrayList<Board> list= service.selectNoticeList(boardType);
		model.addAttribute("list",list);
		return "addition/free";
	}
}
