package kr.or.exhibition.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.exhibition.service.ExhibitionService;
import kr.or.exhibition.vo.Exhibition;

@Controller
public class ExhibitionController {
	@Autowired
	private ExhibitionService service;
	//전시등록 폼
	@RequestMapping(value="/exhibitionFrm.do")
	public String exhibitionFrm() {
		return "exhibition/exhibitionInsert";
	}
	//전시 뷰
	@RequestMapping(value="/exhibitionView.do")
	public String exhibitionView() {
		return "exhibition/exhibitionView";
	}
	//전시 등록
	@RequestMapping(value="/exhibitionInsert.do")
	public String exhibitionInsert (Exhibition exb,MultipartFile upfile, HttpServletRequest request, Model model) {
		if(upfile != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/exhibitionImage/upload/");
			
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
			String exhibitionPhoto = "/resources/exhibitionImage/upload/"+filepath;
			exb.setExhibitionPhoto(exhibitionPhoto);
		}
		int result = service.exhibitionInsert(exb);
		if(result>0) {
			model.addAttribute("msg", "전시 등록 성공");			
		}else {
			model.addAttribute("msg", "전시 등록 실패");
		}
		model.addAttribute("loc", "/exhibitionView.do");
		return "common/msg";
	}
}
