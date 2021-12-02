package kr.or.addition.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.addition.model.dao.AdditionDao;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardComment;
import kr.or.addition.model.vo.BoardPageData;
import kr.or.addition.model.vo.BoardViewData;
import kr.or.addition.model.vo.FileVO;

@Service
public class AdditionService {
	@Autowired
	private AdditionDao dao;

	//글 리스트 조회
	public BoardPageData selectNoticeList(int boardType, int reqPage) {
		// 한페이지에 보여줄 게시물 수
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// 한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("boardType", boardType);
		ArrayList<Board> list = dao.selectNoticeList(map);
		// 페이지네비게이션 제작
		int totalCount = dao.totalCount(map);
		// 전체페이지수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		//요청페이지가 가운데 올 수 있는 pageNo설정
		int pageNo = 1;
		if(reqPage==2) {
			pageNo=2;
		}else if(reqPage==3) {
			pageNo=3;
		}else if(reqPage>3) {
			pageNo = reqPage-2;
			if(totalPage - reqPage < (pageNaviSize-1)) {
				pageNo =  totalPage - (pageNaviSize-1);
			}
		}
		
		//페이지 네비 제작
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			if(boardType==1) {
				pageNavi = "<a href='/additionNotice.do?boardType=1&reqPage="+(reqPage-1)+"'>[이전]</a>";
			}else if(boardType==2) {
				pageNavi = "<a href='/additionQNA.do?boardType=2&reqPage="+(reqPage-1)+"'>[이전]</a>";
			}else {
				pageNavi = "<a href='/additionFree.do?boardType=3&reqPage="+(reqPage-1)+"'>[이전]</a>";
			}
			
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>"; 
			}else {
				if(boardType==1) {
					pageNavi += "<a href='/additionNotice.do?boardType=1&reqPage="+pageNo+"'>"+pageNo+"</a>";
				}else if(boardType==2) {
					pageNavi += "<a href='/additionQNA.do?boardType=2&reqPage="+pageNo+"'>"+pageNo+"</a>";
				}else {
					pageNavi += "<a href='/additionFree.do?boardType=3&reqPage="+pageNo+"'>"+pageNo+"</a>";
				}
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			
			if(boardType==1) {
				pageNavi += "<a href='/additionNotice.do?boardType=1&reqPage="+(reqPage+1)+"'>[다음]</a>";
			}else if(boardType==2) {
				pageNavi += "<a href='/additionNotice.do?boardType=1&reqPage="+(reqPage+1)+"'>[다음]</a>";
			}else {
				pageNavi += "<a href='/additionNotice.do?boardType=1&reqPage="+(reqPage+1)+"'>[다음]</a>";
			}
		}
		

		BoardPageData bpd = new BoardPageData(list, pageNavi, start);
		return bpd;
	}

	
	//글쓰기
	@Transactional
	public int insertBoard(Board b, ArrayList<FileVO> list) {
		int result1 = dao.insertBoard(b);
		int result = 0;
		if(result1>0) {
			int boardNo = b.getBoardNo();
			for(FileVO fv: list) {
				fv.setBoardNo(boardNo);
				result += dao.insertFile(fv);
			}
		}else {
			return -1;
		}
		return result;
	}

	//글보기
	@Transactional
	public BoardViewData selectOneBoard(int boardNo) {
		int result = dao.updateReadCount(boardNo); //조회수올림
		Board b = dao.selectOneBoard(boardNo); //게시글정보
		ArrayList<BoardComment> list = dao.selectCommentList(boardNo);//댓글정보
		BoardViewData bvd = new BoardViewData(list,b);
		return bvd;
	}
	
	//글삭제
	@Transactional
	public int boardDelete(int boardNo) {
		int result = dao.boardDelete(boardNo);
		return result;
	}


}
