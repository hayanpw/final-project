package kr.or.space.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Rental;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceTime;

@Repository
public class SpaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공간 등록
	public int insertSpace(Space s) {
		return sqlSession.insert("space.insertSpace",s);
	}
	//전체 공간 조회
	public ArrayList<Space> selectAllSpace() {
		List<Space> list = sqlSession.selectList("space.selectAllSpace");
		return (ArrayList<Space>)list;
	}
	//파일을 업로드 한 게시물
	public int selectSpaceNo() {
		int result = sqlSession.selectOne("space.selectSpaceNo");
		return result;
	}
	//파일 등록
	public int insertFile(FileVO fv) {
		int result = sqlSession.insert("space.insertFile",fv);
		return result;
	}
	//파일 조회
	public ArrayList<FileVO> selectFile() {
		List<FileVO> list = sqlSession.selectList("space.selectFile");
		return (ArrayList<FileVO>)list;
	}
	//공간 하나 조회
	public Space selectOneSpace(int spaceNo) {
		return sqlSession.selectOne("space.selectOneSpace",spaceNo);
	}
	//공간 파일 조회
	public ArrayList<FileVO> selectSpaceFile(int spaceNo) {
		List<FileVO> list = sqlSession.selectList("space.selectSpaceFile");
		return (ArrayList<FileVO>)list;
	}
	//썸네일 조회
	public FileVO selectThumbnail(int spaceNo) {
		return sqlSession.selectOne("space.selectThumbnail");
	}
	//공간 삭제(del -> Y)
	public int deleteSpace(int spaceNo) {
		return sqlSession.update("space.deleteSpace",spaceNo);
	}
	//1개 공간 파일 조회
	public ArrayList<FileVO> selectFileList(int spaceNo) {
		List<FileVO> list = sqlSession.selectList("space.selectFileList",spaceNo);
		return (ArrayList<FileVO>)list;
	}
	//공간 시간 등록
	public int insertSpaceTime(SpaceTime st) {
		return sqlSession.insert("space.insertSpaceTime",st);
	}
	//시간 조회
	public ArrayList<SpaceTime> selectSpaceTime(int spaceNo) {
		List list = sqlSession.selectList("space.selectSpaceTime",spaceNo);
		return (ArrayList<SpaceTime>)list;
	}
	//1개 시간 조회
	public SpaceTime selectOneTime(int stNo) {
		return sqlSession.selectOne("space.selectOneTime",stNo);
	}
	//공간예약
	public int insertRental(Rental r) {
		return sqlSession.insert("space.insertRental",r);
	}
}
