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
import org.springframework.web.multipart.MultipartFile;

import kr.or.space.model.service.SpaceService;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Space;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;

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
	public String spaceInsertFrm() {
		return "space/spaceInsert";
	}
	// 신청 현황 페이지로 이동
	@RequestMapping(value = "/spaceRes.do")
	public String spaceRes() {
		return "space/spaceRes";
	}

	// 공간 등록
	@RequestMapping(value = "/spaceInsert.do")
	public String spaceInsert(Space s, MultipartFile[] files, HttpServletRequest request, Model model) {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		if (files[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/spaceImage/upload/");
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // test (0부터 . 까지)
				String extention = filename.substring(filename.indexOf(".")); // .txt (.부터 끝까지)
				String filepath = null;
				int count = 0; // 숫자를 올려줄 변수
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // text.txt
					} else {
						filepath = onlyFilename + "_" + count + extention; // test_3.txt
					}
					File checkFile = new File(savePath + filepath); // java.io.File
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복 처리가 끝나면 파일 업로드
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
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
		int result = service.insertSpace(s, list);
		if (result == -1 || result != list.size() ) {
			model.addAttribute("msg", "등록실패");
		} else {
			model.addAttribute("msg", "등록성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";

	}
}
