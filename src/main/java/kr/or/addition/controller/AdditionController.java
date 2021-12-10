package kr.or.addition.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.addition.model.service.AdditionService;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardComment;
import kr.or.addition.model.vo.BoardNext;
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

	// 글리스트조회 공지
	@RequestMapping(value = "/additionBoard.do")
	public String notice(int boardType, int reqPage, Model model) {
		BoardPageData bpd = service.selectNoticeList(boardType, reqPage);
		int nCount = service.selectNewCount(boardType);
		model.addAttribute("totalCount", bpd.getTotalCount());
		model.addAttribute("list", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		model.addAttribute("start", bpd.getStart());
		model.addAttribute("nCount", nCount);
		if (boardType == 1) {
			return "addition/notice";
		} else if (boardType == 2) {
			return "addition/qna";
		} else {
			return "addition/free";
		}
	}

	// 글쓰기폼이동
	@RequestMapping(value = "/boardWriteFrm.do")
	public String boardWriteFrm(int boardType, Model model) {
		model.addAttribute("boardType", boardType);
		return "addition/boardWriteFrm";
	}

	// 글쓰기
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(Board b, MultipartFile[] addFiles, HttpServletRequest request, Model model) {
		// 파일목록을 저장할 List
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		if (addFiles[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/additionImage/");
			for (MultipartFile file : addFiles) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // test (0부터 .앞까지)
				String extention = filename.substring(filename.indexOf(".")); // .txt (.부터 끝까지)
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // test.txt
					} else {
						filepath = onlyFilename + "_" + count + extention;// test_3.txt
					}
					File checkFile = new File(savePath + filepath);// java.io.File
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일업로드
					byte[] bytes = file.getBytes();
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
		int result = service.insertBoard(b, list);
		if (result == -1 || result != list.size()) {
			model.addAttribute("msg", "등록실패");
		} else {
			model.addAttribute("msg", "등록성공");
		}
		if (b.getBoardType() == 1) {
			model.addAttribute("loc", "/additionBoard.do?boardType=1&reqPage=1");
		} else if (b.getBoardType() == 2) {
			model.addAttribute("loc", "/additionBoard.do?boardType=2&reqPage=1");
		} else {
			model.addAttribute("loc", "/additionBoard.do?boardType=3&reqPage=1");
		}
		return "common/msg";
	}

	// 글보기
	@RequestMapping(value = "/boardView.do")
	public String boardView(int boardType, int boardNo, Model model) {
		// boardNo을 이용하여 조회한 board객체,arrayList<fileVo>
		BoardNext info =service.selectNextBoard(boardNo,boardType);
		BoardViewData bvd = service.selectOneBoard(boardNo);
		model.addAttribute("b", bvd.getB());
		model.addAttribute("list", bvd.getList());
		model.addAttribute("info",info);
		if (boardType == 1) {
			return "addition/noticeView";
		} else if (boardType == 2) {
			return "addition/qnaView";
		} else {
			return "addition/freeView";
		}

	}

	// 글삭제하기
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(int boardType, int boardNo, Model model) {
		int result = service.boardDelete(boardNo);
		if (result > 0) {
			model.addAttribute("msg", "삭제성공");

		} else {
			model.addAttribute("msg", "삭제실패");
		}
		if (boardType == 1) {
			model.addAttribute("loc", "/additionBoard.do?boardType=1&reqPage=1");
		} else if (boardType == 2) {
			model.addAttribute("loc", "/additionBoard.do?boardType=2&reqPage=1");
		} else {
			model.addAttribute("loc", "/additionBoard.do?boardType=3&reqPage=1");
		}
		return "common/msg";
	}

	// 오시는길
	@RequestMapping(value = "/additionGuide.do")
	public String additionGuide() {
		return "addition/guide";
	}

	// 할인 및 이벤트
	@RequestMapping(value = "/discount.do")
	public String discount() {
		return "addition/discount";
	}

	// 댓글달기
	@RequestMapping(value = "/insertComment.do")
	public String insertComment(int boardType, BoardComment bc, Model model) {
		int result = service.insertComment(bc);
		if (result > 0) {
			model.addAttribute("msg", "댓글등록성공");
		} else {
			model.addAttribute("msg", "댓글등록실패");
		}
		if (boardType == 2) {
			model.addAttribute("loc", "/boardView.do?boardType=2&boardNo=" + bc.getBoardRef());
		} else {
			model.addAttribute("loc", "/boardView.do?boardType=3&boardNo=" + bc.getBoardRef());
		}
		return "common/msg";
	}

	// 댓글삭제
	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(int boardType, int bcNo, int boardNo, Model model) {
		int result = service.deleteComment(bcNo);
		if (result > 0) {
			model.addAttribute("msg", "삭제성공");
		} else {
			model.addAttribute("msg", "삭제실패");
		}
		if (boardType == 2) {
			model.addAttribute("loc", "/boardView.do?boardType=2&boardNo=" + boardNo);
		} else {
			model.addAttribute("loc", "/boardView.do?boardType=3&boardNo=" + boardNo);
		}
		return "common/msg";
	}

	// 댓글수정
	@RequestMapping(value = "/updateComment.do")
	public String updateComment(int boardType, int bcNo, int boardNo, String bcContent, Model model) {
		int result = service.updateComment(bcNo, bcContent);
		if (result > 0) {
			model.addAttribute("msg", "수정성공");
		} else {
			model.addAttribute("msg", "수정실패");
		}
		if (boardType == 2) {
			model.addAttribute("loc", "/boardView.do?boardType=2&boardNo=" + boardNo);
		} else {
			model.addAttribute("loc", "/boardView.do?boardType=3&boardNo=" + boardNo);
		}
		return "common/msg";
	}

	// summernote 이미지업로드
	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile.do", produces = "application/text;charset=utf-8")
	public String uploadImageBoard(MultipartFile file, HttpServletRequest request) {
		String filepath = null;
		if (file != null) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/additionImage/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
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

		}
		return "/resources/additionImage/" + filepath;
	}

	// 파일 다운로드
	@RequestMapping(value = "/fileDown.do")
	public void fileDown(String filename, String filepath, HttpServletRequest request, HttpServletResponse response) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/additionImage/");
		String file = savePath + filepath;
		FileInputStream fis;
		try {
			fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream sos;
			try {
				sos = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(sos);
				String resFilename = ""; // 최종 다운로드 할 파일 이름
				boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1
						|| request.getHeader("user-agent").indexOf("Trident") != -1;
				if (bool) {// 브라우저가 IE인경우
					resFilename = URLEncoder.encode(filename, "UTF-8");
					resFilename = resFilename.replaceAll("\\\\", "%20");
				} else {// 그외 다른 브라우저인 경우
					resFilename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
				}
				// 파일다운로드를 위한 HTTP header설정(사용자 브라우저에 파일다운로드임을 선언)
				response.setContentType("application/octet-stream");
				// 다운로드할 파일 이름 지정
				response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);
				// 파일전송
				while (true) {
					int read = bis.read();
					if (read != -1) {
						bos.write(read);
					} else {
						break;
					}
				}
				bis.close();
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 글검색
	@RequestMapping(value = "/searchKeyword.do")
	public String searchKeyword(int boardType, int reqPage, String keyword, String type, Model model) {
		BoardPageData bpd = service.searchKeyword(reqPage, boardType, keyword, type);
		model.addAttribute("list", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		model.addAttribute("start", bpd.getStart());
		if (boardType == 1) {
			return "addition/noticeSearch";
		} else if (boardType == 2) {
			return "addition/qnaSearch";
		} else {
			return "addition/freeSearch";
		}

	}

	// 글수정폼이동
	@RequestMapping(value = "/boardUpdateFrm.do")
	public String boardUpdateFrm(int boardNo, Model model) {
		BoardViewData bvd = service.selectOneBoard(boardNo);
		model.addAttribute("b", bvd.getB());
		System.out.println(bvd.getB());
		return "addition/boardUpdateFrm";
	}

	
	/*
	// 글수정
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(Board b, int status, String oldFilename, String oldFilepath,
			MultipartFile[] upfiles, HttpServletRequest request, Model model) {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		if (status == 2) { // 기존파일 지웠을때
			String savePath = request.getSession().getServletContext().getRealPath("/resources/additionImage/");
			File delFile = new File(savePath + "/" + oldFilepath);
			delFile.delete(); // 서버에서 파일 지우기
			if (upfiles[0].isEmpty()) {// 새첨부파일 없을때
			} else { // 첨부파일 있을때
				for (MultipartFile file : upfiles) {
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
							File checkFile = new File(savePath + filepath);
							break;
						}
						count++;
					}
					try {
						FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						// 파일업로드
						byte[] bytes = file.getBytes();
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
		}
		int result = service.boardUpdate(b);
		if (result > 0) {
			model.addAttribute("msg", "수정성공");
		} else {
			model.addAttribute("msg", "수정실패");
		}
		if (b.getBoardType() == 2) {
			model.addAttribute("loc", "/boardView.do?boardType=2&boardNo=" + b.getBoardNo());
		} else if(b.getBoardType() == 1){
			model.addAttribute("loc", "/boardView.do?boardType=1&boardNo=" + b.getBoardNo());
		} else {
			model.addAttribute("loc", "/boardView.do?boardType=3&boardNo=" + b.getBoardNo());
		}
		return "common/msg";

	}
	*/

}
