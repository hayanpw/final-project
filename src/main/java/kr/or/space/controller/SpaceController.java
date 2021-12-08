package kr.or.space.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.member.service.MemberService;
import kr.or.member.vo.Member;
import kr.or.space.model.service.MailSend;
import kr.or.space.model.service.SpaceService;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Rental;
import kr.or.space.model.vo.ResSpace;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceAdmin;
import kr.or.space.model.vo.SpaceTime;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	@Autowired
	private MailSend mailService;
	
	@RequestMapping(value = "/test.do")
	public String test() {
		return "space/test";
	}

	// 공간메인 이동
	@RequestMapping(value = "/spaceMain.do")
	public String spaceMain(Model model) {
		ArrayList<Space> list = service.selectAllSpace();
		ArrayList<FileVO> fList = service.selectFile();
		model.addAttribute("list", list);
		model.addAttribute("fList", fList);
		return "space/spaceMain";
	}

	// 공간 전체 조회
	@RequestMapping(value = "/spaceList.do")
	public String spaceList(Model model) {
		ArrayList<Space> spaceList = service.selectAllSpace();
		ArrayList<FileVO> fileList = service.selectFile();
		model.addAttribute("spaceList", spaceList);
		model.addAttribute("fileList", fileList);
		return "space/spaceList";
	}

	// 공간 등록페이지로 이동
	@RequestMapping(value = "/spaceInsertFrm.do")
	public String spaceInsertFrm(Model model) {
		return "space/spaceInsert";
	}
	// 공간 수정 페이지로 이동
	@RequestMapping(value = "/spaceUpdate.do")
	public String spaceUpdate(int spaceNo, Model model) {
		Space space =service.selectOneSpace(spaceNo);
		ArrayList<FileVO> fv = service.selectSpaceFile(spaceNo);
		FileVO t = service.selectThumbnail(spaceNo);
		model.addAttribute("s", space);
		model.addAttribute("fv", fv);
		model.addAttribute("t", t);
		return "space/spaceUpdateFrm";
	}
	// 신청 현황 페이지로 이동
	@RequestMapping(value = "/spaceRes.do")
	public String spaceRes(int spaceNo,Model model) {
		ArrayList<Space> list = service.selectAllSpace();
		Space s = service.selectOneSpace(spaceNo);
		ArrayList<SpaceTime> st = service.selectSpaceTime(spaceNo);
		ArrayList<FileVO> fv = service.selectFileList(spaceNo);
		model.addAttribute("list", list);
		model.addAttribute("s", s);
		model.addAttribute("st", st);
		model.addAttribute("fv", fv);
		return "space/spaceRes";
	}

	// 공간 등록
	@RequestMapping(value = "/spaceInsert.do")
	public String spaceInsert(Space s, MultipartFile[] files,int thumbnail, String[] startTime, String[] endTime, HttpServletRequest request, Model model) {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		ArrayList<SpaceTime> stList = new ArrayList<SpaceTime>();
		if (files[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/spaceImage/upload/");
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
				FileVO fv = new FileVO();
				fv.setFilename(filename);
				fv.setFilepath(filepath);

				list.add(fv);
				
			}
		}
		list.get(thumbnail).setThumbnail("Y");
		//시간 셋팅
		for(int i=0; i < startTime.length; i++) {
			SpaceTime st = new SpaceTime();
			st.setStartTime(startTime[i]);
			st.setEndTime(endTime[i]);
			stList.add(st);
		}
		int result = service.insertSpace(s, list, stList);
		if (result == -1 || result != list.size() ) {
			model.addAttribute("msg", "등록실패");
		} else {
			model.addAttribute("msg", "등록성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";

	}
	//공간 삭제
	@RequestMapping(value = "/spaceDelete.do")
	public String spaceDelete(int spaceNo, Model model) {
		int result = service.deleteSpace(spaceNo);
		if(result > 0) {
			model.addAttribute("msg", "삭제 한 공간은 관리자 페이지에서 찾을 수 있습니다.");
		}else{
			model.addAttribute("msg", "삭제를 실패하였습니다.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	//공간 상세보기
	@RequestMapping(value = "/spaceInfo.do")
	public String spaceInfo(int spaceNo,int stNo,String rentalDate, Model model) {
		Space s = service.selectOneSpace(spaceNo);
		ArrayList<FileVO> fv = service.selectFileList(spaceNo);
		SpaceTime st =service.selectOneTime(stNo);
		model.addAttribute("st", st);
		model.addAttribute("s", s);
		model.addAttribute("rentalDate", rentalDate);
		model.addAttribute("fv", fv);
		return "space/spaceInfo";
	}
	//대관
	@RequestMapping(value = "/spaceRental.do")
	public String spaceRental(Model model, Rental r) {
		int result = service.insertRental(r);
		if(result>0) {
			model.addAttribute("msg", "신청이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "신청이 실패하였습니다.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	//관리자페이지 - 예약 관리
	@RequestMapping(value = "/spaceAdmin.do")
	public String spaceAdmin(Model model) {
		ArrayList<SpaceAdmin>list = service.selectAllRental();
		model.addAttribute("list", list);
		return "space/spaceAdmin";
	}
	//마이페이지- 예약내역 관리
	@RequestMapping(value = "/spaceMypage.do")
	public String spaceMypage(String memberId, Model model) {
		ArrayList<Rental> rList = service.selectRentalList(memberId);
		ArrayList<Space> sList = service.selectAllSpace();
		ArrayList<FileVO> fvList = service.selectFile();
		model.addAttribute("rList", rList);
		model.addAttribute("sList", sList);
		model.addAttribute("fvList", fvList);
		return "space/spaceMypage";
	}
	//대관 확정 메일 보내기
	@RequestMapping(value = "/mailSend.do")
	public String mailSend(String memberId,int rentalNo, Model model) {
		String email = service.selectEmail(memberId);
		String result = mailService.mailSend("redsix622@naver.com");
		int result1 = service.updateRentalStatus(rentalNo);
		if(result1>0) {
			ArrayList<SpaceAdmin>list = service.selectAllRental();
			model.addAttribute("list", list);
			return "space/spaceAdmin";
		}else{
			model.addAttribute("msg", "메일 발송에 실패하였습니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	//예약 된 시간 리스트 ajax
	@ResponseBody
	@RequestMapping(value = "/selectResList.do", produces = "application/json;charset=utf-8")
	public String selectResList(String selectDate, int spaceNo, Model model) {
		ArrayList<ResSpace> list = service.selectResList(selectDate, spaceNo);
		return new Gson().toJson(list); 
	}
}
