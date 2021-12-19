package kr.or.academy.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.academy.service.AcademyService;
import kr.or.academy.vo.Academy;
import kr.or.academy.vo.AcademyCategory;
import kr.or.academy.vo.AcademyPagingVo;
import kr.or.academy.vo.AcademyPayment;

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
	public String academyList(Academy a,Model model,int reqPage,String category) {
		//전체 페이지 겟수 출력 
		System.out.println(category);
		int totalCount = service.academyTotal();
		ArrayList<Academy> list = service.selectAcademyList(reqPage,category);
		int count = list.size();
		ArrayList<AcademyCategory> acList = service.selectAcademyCategory();
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("count",count);
		model.addAttribute("acList",acList);
		return "academy/academyList";
	}
	//수업 등록
	@RequestMapping(value="/academyInsert.do")
	public String academyInsert(Academy a,MultipartFile upfile, HttpServletRequest request,Model model) {
		if(upfile != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/academyImage/upload/");
			System.out.println(upfile.getSize());
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
		model.addAttribute("loc", "/academyList.do?reqPage=4&category=all");
		return "common/msg";
	}
	//더보기
	@ResponseBody
	@RequestMapping(value ="/moreAcademy.do",produces = "application/json;charset=utf-8")
	public String moreAcademy(int start, String category) {
		//아작스 data start 값 strat 받아옴
		ArrayList<Academy> list = service.moreAcademy(start,category);
		return new Gson().toJson(list);
	}
	//카테고리로 조회
	@ResponseBody
	@RequestMapping(value ="/categoryAcademy.do",produces = "application/json;charset=utf-8")
	public String moreAcademy(String category,int reqPage) {
		ArrayList<Academy> list = service.selectAcademyList(reqPage,category);
		return new Gson().toJson(list);
	}
	//검색으로 조회
	@ResponseBody
	@RequestMapping(value ="/searchAcademy.do",produces = "application/json;charset=utf-8")
	public String searchAcademyList(String keyWord,int reqPage) {
		ArrayList<Academy> list = service.searchAcademyList(reqPage,keyWord);
		return new Gson().toJson(list);
	}
	//검색결과 더보기
	@ResponseBody
	@RequestMapping(value ="/searchMoreAcademy.do",produces = "application/json;charset=utf-8")
	public String searchMoreAcademy(int start, String category) {
		//아작스 data start 값 strat 받아옴
		ArrayList<Academy> list = service.searchMoreAcademy(start,category);
		return new Gson().toJson(list);
	}
	//상세보기 로 이동
	@RequestMapping(value="/academyView.do")
	public String academyView(int academyNo, Model model) {
		Academy a = service.selectOneAcademy(academyNo);
		model.addAttribute("a",a);
		return "academy/academyView";
	}
	//전시 결제 페이지로 이동
	@RequestMapping(value="/academyPaymentFrm.do")
	public String academyPaymentFrm(AcademyPayment acp,Model model) {
		model.addAttribute("acp",acp);
		return "academy/academyPayment";
	}
	@ResponseBody
	@RequestMapping(value="academyCredit.do",produces = "application/json;charset=utf-8")
	public String academyCredit (AcademyPayment acp) {
		int result = service.academyCredit(acp);
		return new Gson().toJson(result);
	}
	@ResponseBody
	@RequestMapping(value = "/uploadImageAcademy.do")
	public String uploadImage(MultipartFile file, HttpServletRequest request) {
		String filepath = null;
		if(file != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/academyImage/editor/");
			
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
		return "/resources/academyImage/editor/"+filepath;
	}
//	@RequestMapping(value="/studentView.do")
//	public String studentView (int academyNo,Model model) {
//		
//	}
	@RequestMapping(value="/academyUpdateFrm.do")
	public String academyUpdateFrm (int academyNo,Model model) {
		Academy a = service.selectOneAcademy(academyNo);
		model.addAttribute("a",a);
		return "academy/academyUpdate";
	}
	@RequestMapping(value="/academyUpdate.do")
	public String academyUpdate(Academy a,MultipartFile upfile, HttpServletRequest request,Model model) {
		if(upfile.getSize() > 0) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/academyImage/upload/");
			System.out.println(upfile.getSize());
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
		int result = service.academyUpdate(a);
		if(result>0) {
			model.addAttribute("msg", "수업 수정 성공");			
		}else {
			model.addAttribute("msg", "수업 수정 실패");
		}
		model.addAttribute("loc", "/academyView.do?academyNo="+a.getAcademyNo());
		return "common/msg";
	}
	@RequestMapping(value="/academyAdminList.do")
	public String academyAdminList(Model model) {
		HashMap<String, Object> map = service.academyAdminList();
		model.addAttribute("list", map.get("list"));
		model.addAttribute("last", map.get("last"));
		return "academy/academyAdmin";
	}
	@ResponseBody
	@RequestMapping(value="/countingStar.do")
	public String countingStar(int academyNo) {
		System.out.println("컨트롤러");
		int studentCount = service.countingStar(academyNo);
		if(studentCount == 0) {
			System.out.println(studentCount);
			return "0";
		}else {
			System.out.println(studentCount);
			String count = Integer.toString(studentCount);
			return count;
		}
	}
	//@RequestMapping(value="/academyDelete.do")
	//public String academyDelete (int academyNo,Model model) {
	//	
	//}
}
