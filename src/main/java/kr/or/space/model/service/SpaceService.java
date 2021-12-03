package kr.or.space.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.space.model.dao.SpaceDao;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceTime;

@Service
public class SpaceService {
	@Autowired
	private SpaceDao dao;
	
	@Transactional
	//공간등록 + 파일 업로드
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

	public int deleteSpace(int spaceNo) {
		return dao.deleteSpace(spaceNo);
	}
	//1개 공간의 파일들 가져오기
	public ArrayList<FileVO> selectFileList(int spaceNo) {
		return dao.selectFileList(spaceNo);
	}
}
