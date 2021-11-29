package kr.or.space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.space.model.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
	@RequestMapping(value = "/spaceMain.do")
	public String spaceMain() {
		return "space/spaceMain";
	}
	@RequestMapping(value = "/spaceInsertFrm.do")
	public String spaceInsertFrm() {
		return "space/spaceInsert";
	}
}
