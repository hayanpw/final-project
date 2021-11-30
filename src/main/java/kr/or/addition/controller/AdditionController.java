package kr.or.addition.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardPageData;
import kr.or.addition.model.vo.FileVO;

@Controller
public class AdditionController {
	@Autowired
	private AdditionService service;
	
	@RequestMapping(value = "/addition.do")
	public String addition() {
		return "addition/addition";
	}
	
	//글조회 공지
	@RequestMapping(value = "/additionNotice.do")
	public String notice(int boardType,int reqPage,Model model) {
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return "addition/notice";
	}
	
	
	//글조회 1대1문의
	@RequestMapping(value = "/additionQNA.do") 
	public String qna(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/qna"; 
	 }
	 
	
	//글조회 소통
	@RequestMapping(value = "/additionFree.do") 
	public String free(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/free"; 
	 }
	
	//글쓰기폼이동
	@RequestMapping(value = "/boardWriteFrm.do")
	public String boardWriteFrm(int boardType,Model model) {
		model.addAttribute("boardType",boardType);
		return "addition/boardWriteFrm";
	}
	
	//글쓰기
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(Board b) {
		System.out.println(b.getBoardType());
		System.out.println(b.getBoardWriter());
		return "addition/boardWriteFrm";
	}
	 
}
