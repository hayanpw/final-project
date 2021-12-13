package kr.or.addition.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.addition.model.dao.AdditionDao;
import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardComment;
import kr.or.addition.model.vo.BoardNext;
import kr.or.addition.model.vo.BoardPageData;
import kr.or.addition.model.vo.BoardViewData;
import kr.or.addition.model.vo.FileVO;

@Service
public class AdditionService {
	@Autowired
	private AdditionDao dao;
	
	//글 리스트 조회
		public BoardPageData selectNoticeList(int boardType, int reqPage) {
			//고정공지
			ArrayList<Board> fixlist = dao.selectFixlist();
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
			int pageNo = 0;
			if(reqPage<4) {
				pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize +1;
			}else {
				pageNo = reqPage-2;
			}
			
			String pageNavi = "<ul class ='pagination pagination-lg'>";

			if(reqPage>=4) {
				pageNavi += "<li id='pageNum' class='page-item'>";
				if(boardType==1) {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=1&reqPage="+(reqPage-1)+"'>";
				}else if(boardType==2) {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=2&reqPage="+(reqPage-1)+"'>";
				}else {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=3&reqPage="+(reqPage-1)+"'>";
				}
				pageNavi += "&lt;</a></li>";
			}
			
			//페이지숫자
			for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li id='pageNumAct' class ='page-item active'>";
						if(boardType==1) {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=1&reqPage="+pageNo+"'>";
						}else if(boardType==2) {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=2&reqPage="+pageNo+"'>";
						}else {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=3&reqPage="+pageNo+"'>";
						}
						pageNavi += pageNo+"</a></li>";
					}else {
						pageNavi += "<li id='pageNum' class ='page-item'>";
						if(boardType==1) {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=1&reqPage="+pageNo+"'>";
						}else if(boardType==2) {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=2&reqPage="+pageNo+"'>";
						}else {
							pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=3&reqPage="+pageNo+"'>";
						}
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
			}
			
			
			if(pageNo <= totalPage) {
				pageNavi += "<li id='pageNum' class ='page-item'>";
				if(boardType==1) {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=1&reqPage="+(reqPage+1)+"'>";
				}else if(boardType==2) {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=2&reqPage="+(reqPage+1)+"'>";
				}else {
					pageNavi += "<a class='page-link' href='/additionBoard.do?boardType=3&reqPage="+(reqPage+1)+"'>";
				}
				pageNavi += "&gt;</a></li>";
				
			}
			pageNavi +="</ul>";
			
			fixlist.addAll(list);
			BoardPageData bpd = new BoardPageData(fixlist, pageNavi, start,totalCount);
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
		ArrayList<FileVO> flist = dao.selectFileList(boardNo);
		b.setList(flist);
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

	//댓글달기
	@Transactional
	public int insertComment(BoardComment bc) {
		int result= dao.insertComment(bc);
		return result;
	}

	//댓글삭제
	@Transactional
	public int deleteComment(int bcNo) {
		int result = dao.deleteComment(bcNo);
		return result;
	}


	//댓글수정
	@Transactional
	public int updateComment(int bcNo, String bcContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bcNo", bcNo);
		map.put("bcContent", bcContent);
		int result = dao.updateComment(map);
		return result;
	}

	//새글수 조회
	public int selectNewCount(int boardType) {
		int nCount =dao.selectNewCount(boardType);
		return nCount;
	}


	public BoardPageData searchKeyword(int reqPage,int boardType,String keyword,String type) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// 한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("boardType", boardType);
		map.put("keyword", keyword);
		map.put("type",type);
		ArrayList<Board> list=dao.searchKeyword(map);
		// 페이지네비게이션 제작
		int totalCount = dao.totalKCount(map);
		// 전체페이지수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		//요청페이지가 가운데 올 수 있는 pageNo설정
		int pageNo = 0;
		if(reqPage<4) {
			pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize +1;
		}else {
			pageNo = reqPage-2;
		}
		
		
		String pageNavi = "<ul class ='pagination pagination-lg'>";

		if(reqPage>=4) {
			pageNavi += "<li id='pageNum' class='page-item'>";
			if(boardType==1) {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=1&reqPage="+(reqPage-1)+"'>";
			}else if(boardType==2) {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=2&reqPage="+(reqPage-1)+"'>";
			}else {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=3&reqPage="+(reqPage-1)+"'>";
			}
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li id='pageNumAct' class ='page-item active'>";
					if(boardType==1) {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=1&reqPage="+pageNo+"'>";
					}else if(boardType==2) {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=2&reqPage="+pageNo+"'>";
					}else {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=3&reqPage="+pageNo+"'>";
					}
					pageNavi += pageNo+"</a></li>";
				}else {
					pageNavi += "<li id='pageNum' class ='page-item'>";
					if(boardType==1) {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=1&reqPage="+pageNo+"'>";
					}else if(boardType==2) {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=2&reqPage="+pageNo+"'>";
					}else {
						pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=3&reqPage="+pageNo+"'>";
					}
					pageNavi += pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break;
				}
		}
		
		
		if(pageNo <= totalPage) {
			pageNavi += "<li id='pageNum' class ='page-item'>";
			if(boardType==1) {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=1&reqPage="+(reqPage+1)+"'>";
			}else if(boardType==2) {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=2&reqPage="+(reqPage+1)+"'>";
			}else {
				pageNavi += "<a class='page-link' href='/searchKeyword.do?type="+type+"&keyword="+keyword+"&boardType=3&reqPage="+(reqPage+1)+"'>";
			}
			pageNavi += "&gt;</a></li>";
		
		}
		pageNavi +="</ul>";
		
		BoardPageData bpd = new BoardPageData(list, pageNavi, start,totalCount);
		return bpd;
	}

	@Transactional
	public int boardUpdate(Board b) {
		int result=dao.boardUpdate(b);
		return result;
	}

	
	public BoardNext selectNextBoard(int boardNo,int boardType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("boardType", boardType);
		BoardNext info = dao.selectNextBoard(map);
		return info;
	}

	@Transactional
	public int regulationBoard(int boardNo) {
		int result=dao.regulationBoard(boardNo);
		return result;
	}
	
	@Transactional
	public int removeRegulationBoard(int boardNo) {
		int result=dao.removeRegulationBoard(boardNo);
		return result;
	}
	
	

}
