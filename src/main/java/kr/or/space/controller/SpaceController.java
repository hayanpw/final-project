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
	public String spaceMain() {
		return "space/spaceMain";
	}

	// 공간 전체 조회
	@RequestMapping(value = "/spaceList.do")
	public String spaceList(Model model) {
		ArrayList<Space> list = service.selectAllSpace();
		model.addAttribute("list", list);
		return "space/spaceList";
	}

	// 공간 등록페이지로 이동
	@RequestMapping(value = "/spaceInsertFrm.do")
	public String spaceInsertFrm() {
		return "space/spaceInsert";
	}

	// 공간 등록
	@RequestMapping(value = "/spaceInsert.do")
	public String spaceInsert(Space s, MultipartFile[] files, HttpServletRequest request, Model model) {
		// 1. 파일 목록을 저장할 List
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		// 2. MultipartFile[] 배열은 파일을 첨부하지 않더라도 무조건 길이가 1인 배열
		// 배열의 첫번째 파일이 비어있는지 체크하는 방식으로 파일첨부 여부 확인
		if (files[0].isEmpty()) {
			// 첨부 파일이 없는 경우
		} else {
			// 첨부 파일이 있는 경우
			// MultipartFile을 이용해서 파일 업로드 작업을 수행해야 함
			// 파일을 업로드 할 경로 설정
			// request ...getRealPath -> /webapp/폴더
			String savePath = request.getSession().getServletContext().getRealPath("/resources/spaceImage/upload/");
			// 반복문을 이용해서 파일 처리(파일 업로드)
			for (MultipartFile file : files) {
				// 유저가 올린 파일명이 이미 업로드 폴더에 존재하면 덮어쓰기가 되어 이전 파일이 삭제
				// 파일명 중복 처리
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename();
				// test.txt -> test_1.txt
				// test.txt -> test .txt -> 파일명을 확장자 기준으로 나눔
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // test (0부터 . 까지)
				String extention = filename.substring(filename.indexOf(".")); // .txt (.부터 끝까지)
				// 실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
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
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도증가를 위한 보조 스트림
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
		if (result <0 ) {
			model.addAttribute("msg", "등록실패");
		} else {
			model.addAttribute("msg", "등록성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";

	}
}
