package kr.or.space.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.space.model.service.SpaceService;
import kr.or.space.model.vo.Space;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
	//공간메인 이동
	@RequestMapping(value = "/spaceMain.do")
	public String spaceMain() {
		return "space/spaceMain";
	}
	//공간 등록페이지로 이동
	@RequestMapping(value = "/spaceInsertFrm.do")
	public String spaceInsertFrm() {
		return "space/spaceInsert";
	}
	//공간 등록
	@RequestMapping(value = "/spaceInsert.do")
	public String spaceInsert(Space s, Model model) {
		int result = service.insertSpace(s);
		if(result>0) {
			model.addAttribute("msg", "등록성공");
		}else {
			model.addAttribute("msg", "등록실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	//공간 전체 조회
	@RequestMapping(value = "/spaceList.do")
	public String spaceList(Model model) {
		ArrayList<Space> list = service.selectAllSpace();
		model.addAttribute("list", list);
		return "space/spaceList";
	}
}
