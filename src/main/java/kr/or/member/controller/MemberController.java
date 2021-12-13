package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.service.MemberService;
import kr.or.member.service.SendMail;
import kr.or.member.vo.Member;
import kr.or.member.vo.MemberPage;

@Controller
public class MemberController {
	
	@Autowired//스프링이 서버 시작시 자동으로 생성한 객체중 아래 변수와 일치하는 데이터타입의 객체를 찾다서 변수에 저장 의존성 주입(DI)
	private MemberService service;
	@Autowired
	private SendMail sendMailservice;
	
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
		return "member/mypage";
	}
	@RequestMapping(value="/adminpage.do")
	public String adminpage() {
		return "common/adminpage";
	}
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model ) {
		Member m = service.selectOneMemberPw(member);
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
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	@RequestMapping(value="/join.do")
	public String join(Member m,String email1, String email2, String memberPhone1,String memberPhone2,String memberPhone3,Model model) {
		String email = email1+"@"+email2;
		String phone = memberPhone1+memberPhone2+memberPhone3;
		m.setMemberPhone(phone);
		m.setMemberEmail(email);
		int result = service.insertMemberPw(m);
		if(result>0) {
			model.addAttribute("msg","회원가입성공");
			model.addAttribute("loc","/");
		}else {
			model.addAttribute("msg","회원가입실패");
			model.addAttribute("loc","/joinFrm.do");
		}
		return "common/msg";
	}
	@RequestMapping(value="/idCheck.do")
	@ResponseBody
	public int idchk(String memberId) {
		Member m = service.selectOneMemberId(memberId);
		if(m == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	@RequestMapping(value="/pwCheck.do")
	public String pwchk(Member member, Model model) {
		Member m = service.selectOneMemberPw(member);
		if(m != null) {
			return "member/memberUpdate";
		}else {
			model.addAttribute("msg","비밀번호를 확인 하세요");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping(value="/ajaxEmailCheck.do")
	@ResponseBody
	public int ajaxEmailCheck(String memberEmail) {
		Member m = service.selectOneMemberEmail(memberEmail);
		System.out.println(memberEmail);
		if(m == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	@RequestMapping(value="/sendMail.do")
	@ResponseBody
	public String sendMail(String email,Model model ) {
		String result = sendMailservice.mailSend(email);
		return result;
	}
	
	@RequestMapping(value="/memberUpdate.do")
		public String updateMember(Member member,Model model) {
			int result = service.updateMember(member);
			if(result>0) {
				model.addAttribute("msg","정보변경 성공");
			}else {
				model.addAttribute("msg","정보변경 실패");
			}
			model.addAttribute("loc","/");
			return "common/msg";
		}
	@RequestMapping(value="/searchidpw.do")
	public String searchidpw(Member member,Model model) {
		System.out.println(member);
	int result = service.searchidPw(member);
	if(result>0) {
		model.addAttribute("msg","정보변경 성공");
	}else {
		model.addAttribute("msg","정보변경 실패");
	}
	model.addAttribute("loc","/");
	return "common/msg";
}
	@RequestMapping(value="/searchId.do")
	@ResponseBody
	public String searchId(Member member,Model model) {
		Member m = service.searchId(member);
		
		String memberId = m.getMemberId();
		return memberId;
	}
	@RequestMapping(value="/searchMember.do")
	public String searchMember(String search, Model model) {
		ArrayList<Member> list = service.searchMember(search);
		model.addAttribute("list",list);
		model.addAttribute("search",search);
		return "member/AllMember";
	}		
	@RequestMapping(value="/updateMemberlist.do")
	@ResponseBody
	public int updateMemberLevel(Member member) {
		int result = service.updateMemberLevel(member);
		return result;
	}
	@RequestMapping(value="/allMember.do")
	public String allMember(int reqPage, Model model) {
		MemberPage mpg = service.selectAllMember(reqPage);
		model.addAttribute("totalCount", mpg.getTotalCount());
		model.addAttribute("list",mpg.getList());
		model.addAttribute("pageNavi", mpg.getPageNavi());
		model.addAttribute("start", mpg.getStart());
		return "member/AllMember";
	}
	
	
}
	
	
	
	
	
	
	
	


