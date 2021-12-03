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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardComment;
import kr.or.addition.model.vo.BoardPageData;
import kr.or.addition.model.vo.BoardViewData;
import kr.or.addition.model.vo.FileVO;

@Controller
public class AdditionController {
	@Autowired
	private AdditionService service;
	
	@RequestMapping(value = "/addition.do")
	public String addition() {
		return "addition/addition";
	}
	
	//글리스트조회 공지
	@RequestMapping(value = "/additionNotice.do")
	public String notice(int boardType,int reqPage,Model model) {
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return "addition/notice";
	}
	
	
	//글리스트조회 1대1문의
	@RequestMapping(value = "/additionQNA.do") 
	public String qna(int boardType,int reqPage,Model model) { 
		BoardPageData bpd= service.selectNoticeList(boardType,reqPage);
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("start",bpd.getStart());
		return"addition/qna"; 
	 }
	 
	
	//글리스트조회 소통
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
				if(files[0].isEmpty()) {
				}else {
					String savePath =request.getSession().getServletContext().getRealPath("/resources/additionImage/");
					for(MultipartFile file:files) {
						String filename = file.getOriginalFilename();
						String onlyFilename = filename.substring(0,filename.indexOf(".")); //test (0부터 .앞까지)
						String extention = filename.substring(filename.indexOf(".")); //.txt (.부터 끝까지)
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
						try {
							FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
							BufferedOutputStream bos =new BufferedOutputStream(fos);
							//파일업로드
							byte[] bytes= file.getBytes();
							bos.write(bytes);
							bos.close();
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						} catch (IOException e) {
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
	
	//글보기
	@RequestMapping(value = "/boardView.do")
	public String boardView(int boardType,int boardNo,Model model) {
		//boardNo을 이용하여 조회한 board객체,arrayList<fileVo>
		BoardViewData bvd = service.selectOneBoard(boardNo);
		model.addAttribute("b",bvd.getB());
		model.addAttribute("list",bvd.getList());
		
		if(boardType==1) {
			return "addition/noticeView";
		}else if(boardType==2){
			return "addition/qnaView";
		}else {
			return "addition/freeView";
		}
		
	}
	
	//글삭제하기
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(int boardNo,Model model) {
		int result = service.boardDelete(boardNo);
		if(result>0) {
			model.addAttribute("msg", "삭제성공");
			
		}else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc","/additionNotice.do?boardType=1&reqPage=1");
		return "common/msg"; 
	}
	//오시는길
	@RequestMapping(value="/additionGuide.do")
	public String additionGuide() {
		return "addition/guide";
	}
	//할인 및 이벤트
	@RequestMapping(value = "/discount.do")
	public String discount() {
		return "addition/discount";
	}
	//댓글달기
	@RequestMapping(value = "/insertComment.do")
	public String insertComment(BoardComment bc,Model model) {
		int result = service.insertComment(bc);
		if(result>0) {
			model.addAttribute("msg","댓글등록성공");
		}else {
			model.addAttribute("msg","댓글등록실패");
		}
		model.addAttribute("loc","/boardView.do?boardType=3&boardNo="+bc.getBoardRef());
		return "common/msg";
	}
	
	//댓글삭제
	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(int bcNo,int boardNo,Model model) {
		int result =service.deleteComment(bcNo);
		if(result>0) {
			model.addAttribute("msg","삭제성공");
		}else {
			model.addAttribute("msg","삭제실패");
		}
		model.addAttribute("loc","/boardView.do?boardType=3&boardNo="+boardNo);
		return "common/msg";
	}
	
	//댓글수정
	@RequestMapping(value = "/updateComment.do")
	public String updateComment(int bcNo,int boardNo,String bcContent,Model model) {
		int result = service.updateComment(bcNo,bcContent);
		if(result>0) {
			model.addAttribute("msg","수정성공");
		}else {
			model.addAttribute("msg","수정실패");
		}
		model.addAttribute("loc","/boardView.do?boardType=3&boardNo="+boardNo);
		return "common/msg";
	}
	
	//summernote 이미지업로드
	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile.do", produces="application/text;charset=utf-8")
	public String uploadImageBoard(MultipartFile file, HttpServletRequest request) {
		String filepath = null;
		if(file != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/additionImage/");
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
		return "/resources/additionImage/"+filepath;
	}
}
