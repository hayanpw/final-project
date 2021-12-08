package kr.or.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.vo.Member;
import kr.or.space.model.dao.SpaceDao;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Rental;
import kr.or.space.model.vo.ResSpace;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceAdmin;
import kr.or.space.model.vo.SpaceMypage;
import kr.or.space.model.vo.SpacePageNavi;
import kr.or.space.model.vo.SpaceTime;
import kr.or.space.model.vo.UseBoard;

@Service
public class SpaceService {
	@Autowired
	private SpaceDao dao;
	
	//공간등록 + 파일 업로드
	@Transactional
	public int insertSpace(Space s, ArrayList<FileVO> list, ArrayList<SpaceTime> stList) {
		int result1 = dao.insertSpace(s);
		int stResult = 0;
		int result=0;
		if(result1>0) {
			for(FileVO fv : list) {
				fv.setSpaceNo(s.getSpaceNo());
				result += dao.insertFile(fv);
			}
			for(SpaceTime st : stList) {
				st.setSpaceNo(s.getSpaceNo());
				stResult = dao.insertSpaceTime(st);
			}
		}else {
			return -1;
		}
		return result;		
	}
	
	public ArrayList<Space> selectAllSpace() {
		ArrayList<Space> list = dao.selectAllSpace();
		return list;
	}
	//모든 파일 가져오기
	public ArrayList<FileVO> selectFile() {
		ArrayList<FileVO> fileList = dao.selectFile();
		return fileList;
	}

	public Space selectOneSpace(int spaceNo) {
		return dao.selectOneSpace(spaceNo);
	}

	public ArrayList<FileVO> selectSpaceFile(int spaceNo) {
		return dao.selectSpaceFile(spaceNo);
	}
	//1개 공간 썸네일 가져오기
	public FileVO selectThumbnail(int spaceNo) {
		return dao.selectThumbnail(spaceNo);
	}
	//공간 삭제
	@Transactional
	public int deleteSpace(int spaceNo) {
		return dao.deleteSpace(spaceNo);
	}
	//1개 공간의 파일들 가져오기
	public ArrayList<FileVO> selectFileList(int spaceNo) {
		return dao.selectFileList(spaceNo);
	}
	//시간 조회
	public ArrayList<SpaceTime> selectSpaceTime(int spaceNo) {
		return dao.selectSpaceTime(spaceNo);
	}
	//하나의 시간 조회
	public SpaceTime selectOneTime(int stNo) {
		return dao.selectOneTime(stNo);
	}
	//공간 예약
	@Transactional
	public int insertRental(Rental r) {
		return dao.insertRental(r);
	}
	//한사람이 예약한 대관 내역 조회
	public ArrayList<Rental> selectRentalList(String memberId) {
		return dao.selectRentalList(memberId);
	}
	//모든 대관 리스트 조회
	public ArrayList<SpaceAdmin> selectAllRental() {
		return dao.selectAllRental();
	}
	//이메일
	public String selectEmail(String memberId) {
		return dao.selectEmail(memberId);
	}
	//상태 업데이트
	public int updateRentalStatus(int rentalNo) {
		return dao.updateRentalStatus(rentalNo);
	}
	//예약한 시간 조회
	public ArrayList<ResSpace> selectResSpace(int spaceNo) {
		return dao.selectResSapce(spaceNo);
	}
	//예약한 시간 리스트
	public ArrayList<ResSpace> selectResList(String selectDate, int spaceNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectDate", selectDate);
		map.put("spaceNo", spaceNo);
		return dao.selectResList(map);
	}
	//마이페이지 - 예약내역 조회
	public ArrayList<SpaceMypage> selectSpaceMypage(String memberId) {
		return dao.selectSpaceMypage(memberId);
	}
	//사용 게시판-페이징
	public SpacePageNavi selectSpacePageNavi(int reqPage) {
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<UseBoard> list = dao.selectUseBoardList(map);
		
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a href='/spaceBoardtList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		//페이지숫자
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='active'>";
				pageNavi += "<a href='/spaceBoardtList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a href='/spaceBoardtList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a href='/spaceBoardtList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		SpacePageNavi page = new SpacePageNavi();
		page.setList(list);
		page.setPageNavi(pageNavi);
		page.setStart(start);
		return page;
	}
}
