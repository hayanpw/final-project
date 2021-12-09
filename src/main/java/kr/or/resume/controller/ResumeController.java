package kr.or.resume.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.resume.service.ResumeService;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumeTbl;
import kr.or.space.model.vo.FileVO;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;
	
	@RequestMapping(value="/resumeFrm.do")
	public String resumeFrm(Model model, String requritTitle, int requritNo) {
		model.addAttribute("requritTitle",requritTitle);
		model.addAttribute("requritNo",requritNo);
		return "resume/resumeInsert";
	}
	@RequestMapping(value="/resumeInsert.do")
	public String resumeInsert(HttpServletRequest request,MultipartFile[] files,Model model,Resume r,ResumeTbl rtbl) {
		ArrayList<ResumeTbl> list = new ArrayList<ResumeTbl>();
		if (files[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/resume/upload/");
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf(".")); 
				String extention = filename.substring(filename.indexOf(".")); 
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention; 
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ResumeTbl rt = new ResumeTbl();
				rt.setFilename(filename);
				rt.setFilepath(filepath);
				list.add(rt);
				
			}
		}
		int result = service.insertResume(r,list);
		if (result == -1 || result != list.size()) { // 파일 갯수 만큼 += (누적) 되게 되어 있음
			model.addAttribute("msg","등록실패");
		}else {
			model.addAttribute("msg","등록성공");
		}
		model.addAttribute("loc","/");
		return "resume/resumeInsert";
	}
	
}
