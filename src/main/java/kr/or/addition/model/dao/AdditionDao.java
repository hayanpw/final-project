package kr.or.addition.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.addition.model.vo.Board;
import kr.or.addition.model.vo.BoardComment;
import kr.or.addition.model.vo.BoardNext;
import kr.or.addition.model.vo.FileVO;

@Repository
public class AdditionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Board> selectNoticeList(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("addition.noticeList",map);
		return (ArrayList<Board>)list;
	}

	public int totalCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("addition.totalCount",map);
	}

	public int insertBoard(Board b) {
		
		return sqlSession.insert("addition.insertBoard",b);
	}


	public int selectBoardNo() {
		return sqlSession.selectOne("addition.getBoardNo");
	}


	public int insertFile(FileVO fv) {
		return sqlSession.insert("addition.insertFile",fv);
	}

	public Board selectOneBoard(int boardNo) {
		return sqlSession.selectOne("addition.selectOneBoard",boardNo);
	}

	public int boardDelete(int boardNo) {
		return sqlSession.delete("addition.boardDelete",boardNo);
	}

	public int updateReadCount(int boardNo) {
		return sqlSession.update("addition.updateReadCount",boardNo);
	}

	public ArrayList<BoardComment> selectCommentList(int boardNo) {
		List<BoardComment> list= sqlSession.selectList("addition.selectCommentList",boardNo);
		return (ArrayList<BoardComment>)list;
	}

	public int insertComment(BoardComment bc) {
		return sqlSession.insert("addition.insertComment",bc);
	}

	public int deleteComment(int bcNo) {
		return sqlSession.delete("addition.deleteComment",bcNo);
	}

	public int updateComment(HashMap<String, Object> map) {
		return sqlSession.update("addition.updateComment",map);
	}

	public ArrayList<FileVO> selectFileList(int boardNo) {
		List<FileVO> list = sqlSession.selectList("addition.selectFileList",boardNo);
		return (ArrayList<FileVO>)list;
	}

	public int selectNewCount(int boardType) {
		return sqlSession.selectOne("addition.selectNewCount",boardType);
	}

	public ArrayList<Board> searchKeyword(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("addition.searchKeyword",map);
		return (ArrayList<Board>)list;
	}
	
	public int totalKCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("addition.totalKCount",map);
	}

	public int boardUpdate(Board b) {
		return sqlSession.update("addition.boardUpdate",b);
		
	}

	public BoardNext selectNextBoard(HashMap<String, Object> map) {
		return sqlSession.selectOne("addition.selectNextBoard",map);
	}

	public int fixCount() {
		return sqlSession.selectOne("addition.fixCount");
	}

	public ArrayList<Board> selectFixlist() {
		List<Board> fixlist = sqlSession.selectList("addition.selectFixlist");
		return (ArrayList<Board>)fixlist;
	}

	public int regulationBoard(int boardNo) {
		return sqlSession.update("addition.regulationBoard",boardNo);
	}
	
	public int removeRegulationBoard(int boardNo) {
		return sqlSession.update("addition.removeRegulationBoard",boardNo);
	}

}
