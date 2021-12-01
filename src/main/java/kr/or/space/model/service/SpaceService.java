package kr.or.space.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.space.model.dao.SpaceDao;
import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Space;

@Service
public class SpaceService {
	@Autowired
	private SpaceDao dao;
	
	@Transactional
	//공간등록 + 파일 업로드
	public int insertSpace(Space s, ArrayList<FileVO> list) {
		int result1 = dao.insertSpace(s);
		int result=0;
		if(result1>0) {
			for(FileVO fv : list) {
				fv.setSpaceNo(s.getSpaceNo());
				result += dao.insertFile(fv);
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

	public ArrayList<FileVO> selectFile() {
		ArrayList<FileVO> fileList = dao.selectFile();
		return fileList;
	}
}
