package kr.or.requrit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.requrit.service.RequritService;
import kr.or.requrit.vo.Requrit;
import kr.or.requrit.vo.RequritPageData;


@Controller
public class RequritController {
	@Autowired
	private RequritService service;
	//공지 작성 페이지로 이동
	@RequestMapping(value="/requritFrm.do")
	public String resumerFrm() {
		return "requrit/requritInsert";
	}
	//공지 리스트 페이지로 이동
	@RequestMapping(value="requritList.do")
	public String requritList(Model model , int reqPage) {
		RequritPageData rpd = service.selectRequritPageData(reqPage);
		ArrayList<Requrit> list = service.selectRequritList();
		model.addAttribute("list",list);
		return "requrit/requritList";
	}
	@RequestMapping(value="requritInsert.do")
	public String requritInsert (Requrit r, HttpServletRequest request, Model model ) {
		int result = service.requritInsert(r);
		if(result>0) {
			model.addAttribute("msg", "공고 등록 성공");			
		}else {
			model.addAttribute("msg", "공고 등록 실패");
		}
		model.addAttribute("loc", "/requritList.do");
		return "common/msg";
	}
}
