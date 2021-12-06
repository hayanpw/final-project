package kr.or.academy.controller;

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

import kr.or.academy.service.AcademyService;
import kr.or.academy.vo.Academy;

@Controller
public class AcademyController {
	@Autowired
	private AcademyService service;
	//수업 등록으로 이동
	@RequestMapping(value="/academyFrm.do")
	public String academyFrm() {
		return "academy/academyInsert";
	}
	//리스트 페이지 출력
	@RequestMapping(value="/academyList.do")
	public String academyList(Academy a,Model model,int reqPage) {
		//전체 페이지 겟수 출력 
		int totalCount = service.academyTotal();
		ArrayList<Academy> list = service.selectAcademyList(reqPage);
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		return "academy/academyList";
	}
	//수업 등록
	@RequestMapping(value="/academyInsert.do")
	public String academyInsert(Academy a,MultipartFile upfile, HttpServletRequest request,Model model) {
		if(upfile != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/academyImage/upload/");
			
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
			String academyPhoto = "/resources/academyImage/upload/"+filepath;
			a.setAcademyPhoto(academyPhoto);
		}
		int result = service.academyInsert(a);
		if(result>0) {
			model.addAttribute("msg", "수업 등록 성공");			
		}else {
			model.addAttribute("msg", "수업 등록 실패");
		}
		model.addAttribute("loc", "/academyList.do");
		return "common/msg";
	}
}
