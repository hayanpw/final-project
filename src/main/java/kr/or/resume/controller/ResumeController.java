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
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String resumeInsert(HttpServletRequest request,MultipartFile[] upfiles,Model model,Resume r) {
		ArrayList<ResumeTbl> list = new ArrayList<ResumeTbl>();
		System.out.println(upfiles.length);
		if (upfiles[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/resume/upload/");
			for (MultipartFile file : upfiles) {
				String filename = file.getOriginalFilename();
				System.out.println(filename);
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
		model.addAttribute("loc","/requritList.do?reqPage=1");
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/uploadImageResume.do")
	public String uploadImageResume(MultipartFile file, HttpServletRequest request) {
		String filepath = null;
		if(file != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/resume/img/editor/");
			
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			
			
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
			
		}
		return "/resources/resume/img/editor/"+filepath;
	}
	@RequestMapping(value="/resumeList.do")
	public String resumeList(Model model, int requritNo) {
		ArrayList<Resume> list = service.selectResumeList(requritNo);
		model.addAttribute("list",list);
		return "resume/resumeList";
	}
	@RequestMapping(value="/resumeView.do")
	public String resumeView(Model model, int resumeNo) {
		Resume r = service.selectOneResume(resumeNo);
		model.addAttribute("r",r);
		return "resume/resumeView";
	}
}
