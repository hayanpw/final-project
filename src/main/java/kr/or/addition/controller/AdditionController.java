package kr.or.addition.controller;

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

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardPageData;
import kr.or.addition.model.vo.FileVO;

@Controller
public class AdditionController {
	@Autowired
	private AdditionService service;
	
	@RequestMapping(value = "/addition.do")
	public String addition() {
		return "addition/addition";
	}
	
	//글조회 공지
	@RequestMapping(value = "/additionNotice.do")
	public String notice(int boardType,int reqPage,Model model) {
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return "addition/notice";
	}
	
	
	//글조회 1대1문의
	@RequestMapping(value = "/additionQNA.do") 
	public String qna(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/qna"; 
	 }
	 
	
	//글조회 소통
	@RequestMapping(value = "/additionFree.do") 
	public String free(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/free"; 
	 }
	
	//글쓰기폼이동
	@RequestMapping(value = "/boardWriteFrm.do")
	public String boardWriteFrm(int boardType,Model model) {
		model.addAttribute("boardType",boardType);
		return "addition/boardWriteFrm";
	}
	
	//글쓰기
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(Board b,MultipartFile[] files, HttpServletRequest request, Model model) {
		//파일목록을 저장할 List
				ArrayList<FileVO> list = new ArrayList<FileVO>();
				//MultipartFile[]배열은 파일을 첨부하지 않더라도 무조건 길이가 1인 배열
				//배열의 첫번째 파일이 비어있는지 체크하는 방식으로 파일첨부 여부 확인
				if(files[0].isEmpty()) {
					//첨부파일이 없는경우
				}else {
					//첨부파일이 있는경우
					//MultipartFile을 이용해서 파일업로드 작업을 수행해야함
					//파일을 업로드할 경로 설정
					//request....getRealPath > /webapp/폴더
					String savePath =request.getSession().getServletContext().getRealPath("/resources/additionImage/");
					//반복문을 이용해서 파일 처리(파일 업로드)
					for(MultipartFile file:files) {
						//유저가 올린 파일명이 이미 업로드폴더에 존재하면 덮어쓰기가 되어 이전파일이 삭제
						//파일명중복처리
						//사용자가 올린 파일명
						String filename = file.getOriginalFilename();
						//test.txt 중복되면> 1) test1.txt  2) test.txt1 1형태로 저장
						//test.txtx > test_1.txt test_2.txt
						//test.txt > test       .txt 파일명을 확장자 기준으로 나눔
						String onlyFilename = filename.substring(0,filename.indexOf(".")); //test (0부터 .앞까지)
						String extention = filename.substring(filename.indexOf(".")); //.txt (.부터 끝까지)
						//실제 업로드하 ㄹ파일명을 저장할 변수
						String filepath = null;
						int count = 0;
						while(true) {
							if(count == 0) {
								filepath = onlyFilename+extention; //test.txt
							}else {
								filepath = onlyFilename+"_"+count+extention;//test_3.txt
							}
							File checkFile = new File(savePath+filepath);//java.io.File
							if(!checkFile.exists()) {
								break;
							}
							count++;
						}
						//파일명 중복처리가 끝나면 파일 업로드
						try {
							FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
							//업로드 속도증가를 위한 보조스트림
							BufferedOutputStream bos =new BufferedOutputStream(fos);
							//파일업로드
							byte[] bytes= file.getBytes();
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
				int result = service.insertBoard(b,list);
				if( result==-1 || result != list.size()) {
					model.addAttribute("msg","등록실패");
				}else {
					model.addAttribute("msg", "등록성공");
				}
				if(b.getBoardType()==1) {
					model.addAttribute("loc","/additionNotice.do?boardType=1&reqPage=1");
				}else if(b.getBoardType()==2) {
					model.addAttribute("loc","/additionQNA.do?boardType=2&reqPage=1");
				}else {
					model.addAttribute("loc","/additionFree.do?boardType=3&reqPage=1");
				}
				return "common/msg"; 
	}
	 
}
