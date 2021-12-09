package kr.or.reading.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.reading.model.service.ReadingService;
import kr.or.reading.model.vo.Reading;
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
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/msg";		
		}else {
			return "reading/readingNotice";
		}
	}
	
	@RequestMapping(value="/readingList.do")
	public String readingList(String memberId, HttpSession seesion, Model model) {
		//안내->예약 넘어갈때
		//넘어가기전에 블랙리스트에 등록되어있는지 확인
		//등록되어있다면 alert으로 언제까지 블랙리스트인지 보여주고 메인으로
		//등록되어있지 않다면 예약페이지로 넘어감
		ReadingBlack rb = service.selectOneBlackList(memberId);
		if(rb==null) {
			return "reading/readingList";
		}else {
			model.addAttribute("msg","당신은 "+rb.getBlackEnd()+"까지 열람실 예약을 이용할 수 없습니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	
	@RequestMapping(value="/readingSeat.do")
	public String readingSeat(Reading re, Model model) {
		//날짜 넘겨줌
		model.addAttribute("re", re);
		return "reading/readingSeat";
	}
	
	@RequestMapping(value="/readingOption.do")
	public String readingOption(Reading re, Model model) {
		//선 좌석조회 후 insert
		//같은날 같은 좌석 선택시 이선좌출력
		//선택사항은 update로 selectOneId
		Reading re1 = service.selectOneNum(re);
		Reading re2 = service.selectOneId(re);
		if(re1!=null) {
			model.addAttribute("msg","이미 선택된 좌석입니다.");
			model.addAttribute("loc", "/readingList.do");
		}else if(re2!=null){
			//좌석 선택으로 넘어갈때로 옮길예정
			//이 문구 뜨고 예매내역으로 이동예정
			model.addAttribute("msg",re.getReadingDay()+"일은 이미 예약하셨습니다.");
			model.addAttribute("loc", "/readingList.do");
		}else {
			int result = service.insertReading(re);
			if(result>0){
				Reading re3 = service.selectOneNum(re);
				model.addAttribute("re", re3);
				return "reading/readingOption";
				//model.addAttribute("msg",re.getReadingDay()+"일 "+re.getReadingNum()+"번 좌석을 예약하셨습니다.");
				//model.addAttribute("loc", "/readingOption.do");
			}else {
				model.addAttribute("msg","예약 오류. 다시 시도해주세요.");
				model.addAttribute("loc", "/readingList.do");
			}
		}
		return "common/msg";
	}
	
	@RequestMapping(value="/reservationDay.do")
	public String reservationDay(Reading re, Model model) {
		model.addAttribute("re", re);
		return "reading/reservation";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxSearchReservation.do",produces = "application/json;charset=utf-8")
	public String ajaxSearchReservation(Reading re, Model model) {
		Reading re1 = service.selectOneId(re);
		return new Gson().toJson(re1);
	}
	
	@RequestMapping(value="/reservationInfo.do")
	public String reservationInfo(Reading re, Model model) {
		Reading re1 = service.selectOneId(re);
		model.addAttribute("re", re1);
		return "reading/readingOption";
	}
	
	@ResponseBody
	@RequestMapping(value="/reservationCancel.do",produces = "application/json;charset=utf-8")
	public String reservationCancel(Reading re, Model model) {
		int result = service.reservationCancel(re);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/countSeat.do",produces = "application/json;charset=utf-8")
	public String countSeat(String readingDay, Model model) {
		int result = service.countSeat(readingDay);
		return new Gson().toJson(result);
	}
}
