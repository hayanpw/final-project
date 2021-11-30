package kr.or.reading.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.reading.model.service.ReadingService;
import kr.or.reading.model.vo.ReadingBlack;

@Controller
public class ReadingController {
	
	@Autowired
	private ReadingService service;
	
	@RequestMapping(value="/readingNotice.do")
	public String readingNotice(HttpSession session, Model model) {
		//로그인 해야 열람실 안내를 들어올수있게
		//로그인 구현되면 return 위치 바꿔야됌
		if(session.getAttribute("m")==null) {
			return "reading/readingNotice";
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("loc", "/");
			return "common/msg";		
		}
	}
	
	@RequestMapping(value="/readingList.do")
	public String readingList(String memberId, Model model) {
		//안내->예약 넘어갈때
		//넘어가기전에 블랙리스트에 등록되어있는지 확인
		//등록되어있다면 alert으로 언제까지 블랙리스트인지 보여주고 메인으로
		//등록되어있지 않다면 예약페이지로 넘어감
		ReadingBlack rb = service.selectOneBlackList(memberId);
		if(rb==null) {
			return "reading/readingList";
		}else {
			model.addAttribute("msg","당신은"+rb.getBlackEnd()+"까지 열람실을 이용할 수 없습니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
}
