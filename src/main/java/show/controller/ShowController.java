package show.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import show.service.ShowService;
import show.vo.Show;

@Controller
public class ShowController {
	@Autowired
	private ShowService service;
	
	@RequestMapping(value = "/showList.do")
	public String showList(Model model) {
		ArrayList<Show> list = service.selectShowList();
		model.addAttribute("list", list);
		return "show/showList";
	}
	
	@RequestMapping(value = "/showView.do")
	public String showView(int showNo, Model model) {
		Show s = service.selectOneShow(showNo);
		model.addAttribute("s",s);
		return "show/showView";
	}
	
	
}
