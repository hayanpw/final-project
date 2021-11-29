package show.controller;

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
	
	@RequestMapping(value = "/insertShowFrm.do")
	public String insertShowFrm() {
		return "show/insertShowFrm";
	}
	
	@RequestMapping(value = "insertShow.do")
	public String insertShow(Show s, MultipartFile upfile, HttpServletRequest request, Model model) {
		if(upfile != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/showImage/upload/");
			
			String filename = upfile.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			
			String filepath = null;
			int count = 0;
			while(true) {
				if(count==0) {
					filepath = onlyFilename + extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = upfile.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			s.setFilepath(filepath);
		}
		
		System.out.println(s);
		
//		int result = service.insertShow(s);
//		if(result>0) {
//			model.addAttribute("msg", "공연 등록 성공");			
//		}else {
//			model.addAttribute("msg", "공연 등록 실패");
//		}
//		model.addAttribute("loc", "/showList.do");
//		return "common/msg";
		return "/showList.do";
	}
}
