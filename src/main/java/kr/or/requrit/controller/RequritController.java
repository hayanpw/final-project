package kr.or.requrit.controller;


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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.requrit.service.RequritService;
import kr.or.requrit.vo.Requrit;
import kr.or.requrit.vo.RequritPageData;


@Controller
public class RequritController {
	@Autowired
	private RequritService service;
	//공지 작성 페이지로 이동
	@RequestMapping(value="/requritFrm.do")
	public String resumerFrm() {
		return "requrit/requritInsert";
	}
	//공지 리스트 페이지로 이동
	@RequestMapping(value="/requritList.do")
	public String requritList(Model model , int reqPage) {
		System.out.println("컨트롤러"+reqPage);
		RequritPageData rpd = service.selectRequritPageData(reqPage);
		model.addAttribute("list",rpd.getList());
		model.addAttribute("pageNavi",rpd.getPageNavi());
		model.addAttribute("start",rpd.getStart());
		return "requrit/requritList";
	}
	@RequestMapping(value="/requritInsert.do")
	public String requritInsert (Requrit r, HttpServletRequest request, Model model ) {
		int result = service.requritInsert(r);
		if(result>0) {
			model.addAttribute("msg", "공고 등록 성공");			
		}else {
			model.addAttribute("msg", "공고 등록 실패");
		}
		model.addAttribute("loc", "/requritList.do?reqPage=1");
		return "common/msg";
	}
	@RequestMapping(value="/requritView.do")
	public String requritView(int requritNo,Model model) {
		Requrit r = service.selectOneRequrit(requritNo);
		model.addAttribute("r",r);
		return "requrit/requritView";
	}
	@ResponseBody
	@RequestMapping(value="/uploadImageRequrit.do")
	public String uploadImageResume(MultipartFile file, HttpServletRequest request) {
		String filepath = null;
		if(file != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/requritimage/editor/");
			
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
		return "/resources/requritimage/editor/"+filepath;
	}
	@RequestMapping(value="/deleteRequrit2.do")
		public String deleteRequrit2(int requritNo,Model model) {
			int result = service.deleteRequrit2(requritNo);
			if(result>0) {
				model.addAttribute("msg", "삭제 성공");			
			}else {
				model.addAttribute("msg", "삭제 실패");
			}
			model.addAttribute("loc", "/requritList.do?reqPage=1");
			return "common/msg";
		}
	@RequestMapping(value="/updateRequritFrm.do")
	public String updateRequritFrm(int requritNo,Model model) {
		Requrit r = service.updateRequritFrm(requritNo);
		model.addAttribute("r",r);
		return "requrit/requritUpdateFrm";
	}
	@RequestMapping(value="/requritUpdate.do")
	public String requritUpdate(Requrit r,Model model) {
		int result = service.updateRequritFrm(r);
		if(result>0) {
			model.addAttribute("msg", "수정 성공");			
		}else {
			model.addAttribute("msg", "수정 실패");
		}
		model.addAttribute("loc", "/requritView.do?requritNo="+r.getRequritNo());
		return "common/msg";
	}
	@RequestMapping(value="/deleteRequritList.do")
	public String deleteRequritList(int reqPage, Model model) {
		System.out.println("컨트롤러"+reqPage);
		RequritPageData rpd = service.selectRequritPageDataLast(reqPage);
		model.addAttribute("list",rpd.getList());
		model.addAttribute("pageNavi",rpd.getPageNavi());
		model.addAttribute("start",rpd.getStart());
		return "requrit/requritListDelete";
	}
	@RequestMapping(value="/revivalRequritFrm.do")
	public String revivalRequritFrm (int requritNo, Model model) {
		Requrit r = service.updateRequritFrm(requritNo);
		model.addAttribute("r",r);
		return "requrit/requritRevivalFrm";
	}
	@RequestMapping(value="/requritRevival.do")
	public String requritRevival (Requrit r,Model model) {
		int result = service.RevivalrequritFrm(r);
		if(result>0) {
			model.addAttribute("msg", "수정 성공");			
		}else {
			model.addAttribute("msg", "수정 실패");
		}
		model.addAttribute("loc", "/requritView.do?requritNo="+r.getRequritNo());
		return "common/msg";
	}
	
	
}
