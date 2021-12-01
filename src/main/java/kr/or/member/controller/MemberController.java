package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.or.member.sevice.MemberService;
import kr.or.member.vo.Member;

@Controller
public class MemberController {
	
	@Autowired//스프링이 서버 시작시 자동으로 생성한 객체중 아래 변수와 일치하는 데이터타입의 객체를 찾다서 변수에 저장 의존성 주입(DI)
	private MemberService service;
	public MemberController() {
		super();
		System.out.println("객체 생성");
	}
	@RequestMapping(value="/main.do")
	public String main() {
		return "common/main";
	}
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "common/mypage";
	}
	@RequestMapping(value="/adminpage.do")
	public String adminpage() {
		return "common/adminpage";
	}
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model ) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg","로그인성공");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인 하세요");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}

