package kr.or.space.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.vo.Member;
import kr.or.space.model.dao.SpaceDao;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Rental;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceAdmin;
import kr.or.space.model.vo.SpaceTime;

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
}
