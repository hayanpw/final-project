package kr.or.space.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Rental;
import kr.or.space.model.vo.ResSpace;
import kr.or.space.model.vo.Space;
import kr.or.space.model.vo.SpaceAdmin;
import kr.or.space.model.vo.SpaceMypage;
import kr.or.space.model.vo.SpaceReview;
import kr.or.space.model.vo.SpaceTime;
import kr.or.space.model.vo.UseBoard;

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
	//한사람이 예약한 대관내역 조회
	public ArrayList<Rental> selectRentalList(String memberId) {
		List<Rental> list = sqlSession.selectList("space.selectRentalList",memberId);
		return (ArrayList<Rental>)list;
	}
	//모든 대관 리스트 조회
	public ArrayList<SpaceAdmin> selectAllRental() {
		List<SpaceAdmin> list = sqlSession.selectList("space.selectAllRental");
		return (ArrayList<SpaceAdmin>)list;
	}
	//이메일
	public String selectEmail(String memberId) {
		return sqlSession.selectOne("member.selectEmail",memberId);
	}
	//상태 업데이트
	public int updateRentalStatus(int rentalNo) {
		return sqlSession.update("space.updateRentalStatus",rentalNo);
	}
	//예약한 시간 조회
	public ArrayList<ResSpace> selectResSapce(int spaceNo) {
		List<ResSpace> list = sqlSession.selectList("space.selectResSpace",spaceNo);
		return (ArrayList<ResSpace>)list;
	}
	//예약한 시간 리스트
	public ArrayList<ResSpace> selectResList(HashMap<String, Object> map) {
		List<ResSpace> list = sqlSession.selectList("space.selectResList",map);
		return (ArrayList<ResSpace>)list;
	}
	//마이페이지 - 예약 내역 조회
	public ArrayList<SpaceMypage> selectSpaceMypage(String memberId) {
		List<SpaceMypage> list = sqlSession.selectList("space.selectSpaceMypage",memberId);
		return (ArrayList<SpaceMypage>)list;
	}
	//사용게시판 전체 리스트 조회
	public ArrayList<UseBoard> selectUseBoardList(HashMap<String, Object> map) {
		List<UseBoard> list = sqlSession.selectList("space.selectUseBoardList",map);
		return (ArrayList<UseBoard>)list;
	}
	//리스트 총 수
	public int selectTotalCount() {
		return sqlSession.selectOne("space.selectTotalCount");
	}
	//게시판 작성할 대관 
	public Rental selectRentalNo(int rentalNo) {
		return sqlSession.selectOne("space.selectRentalNo",rentalNo);
	}
	//사용 게시판 등록
	public int insertUseBoard(UseBoard ub) {
		return sqlSession.insert("space.insertUseBoard",ub);
	}
	//대관- 게시판 작성 여부 작성으로 변경
	public int updatUsedBoard(int rentalNo) {
		return sqlSession.update("space.updateUseBoardStatus",rentalNo);
	}
	//사용게시판 조회
	public UseBoard selectOneBoardView(int ubNo) {
		return sqlSession.selectOne("space.selectOneBoardView",ubNo);
	}
	//사용 게시판 삭제
	public int deleteUseBoard(int ubNo) {
		return sqlSession.update("space.deleteUseBoard",ubNo);
	}
	//사용게시판 수정
	public int updateUseBoard(UseBoard u) {
		return sqlSession.update("space.updateUseBoard",u);
	}
	//공간에 따른 리뷰 조회
	public ArrayList<SpaceReview> selectSpaceReview(HashMap<String, Object> map) {
		List<SpaceReview> list = sqlSession.selectList("space.selectSpaceReview",map);
		return (ArrayList<SpaceReview>)list;
				
	}
	//렌탈 정보
	public Rental selectRentalInfo(int rentalNo) {
		return sqlSession.selectOne("space.selectRentalInfo",rentalNo);
	}
	//리뷰 등록
	public int insertReview(SpaceReview sr) {
		return sqlSession.insert("space.insertSpaceReview",sr);
	}
	//리뷰 개수
	public int selectTotalReviewCount(int spaceNo) {
		return sqlSession.selectOne("space.selectTotalReviewCount",spaceNo);
	}
	//리뷰 더보기
	public ArrayList<SpaceReview> moreSpaceReview(HashMap<String, Object> map) {
		List<SpaceReview> list = sqlSession.selectList("space.selectSpaceReview",map);
		return (ArrayList<SpaceReview>)list;
	}
}
