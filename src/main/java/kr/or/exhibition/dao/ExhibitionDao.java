package kr.or.exhibition.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.exhibition.vo.Exhibition;
import kr.or.exhibition.vo.ExhibitionPagingVo;
import kr.or.exhibition.vo.ExhibitionPayment;
import kr.or.exhibition.vo.ExhibitionReview;

@Repository
public class ExhibitionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int exhibitionInsert(Exhibition exb) {
		int result = sqlSession.insert("exhibition.exhibitionInsert",exb);
		return result;
	}

	public Exhibition selectOneExhibition(int exhibitionNo) {
		Exhibition exb = sqlSession.selectOne("exhibition.selectOneExhibition",exhibitionNo);
		return exb;
	}

	public int exhibitionCredit(ExhibitionPayment exbp) {
		int result = sqlSession.insert("exhibition.exhibitionCredit",exbp);
		return result;
	}

	public int exhibitionTotal() {
		int totalCount = sqlSession.selectOne("exhibition.exhibitionTotal");
		return totalCount;
	}

	public ArrayList<Exhibition> selectExhibition(ExhibitionPagingVo ep) {
		List<Exhibition> list = sqlSession.selectList("exhibition.exhibitionList",ep);
		return (ArrayList<Exhibition>)list;
	}

	public int insertExReview(ExhibitionReview exr) {
		int result = sqlSession.insert("exhibition.insertExReview",exr);
		return result;
	}

	public int deleteExReview(ExhibitionReview exr) {
		int result = sqlSession.update("exhibition.deleteExReview",exr);
		return result;
	}

	public int updateExReview(ExhibitionReview exr) {
		int result = sqlSession.update("exhibition.updateExReveiw",exr);
		return result;
	}

	public ArrayList<ExhibitionReview> selectExReview(int exhibitionNo) {
		List<ExhibitionReview> list =sqlSession.selectList("exhibition.selectExReviewList", exhibitionNo);
		return  (ArrayList<ExhibitionReview>)list;
	}

	public double selectStarAvg(int exhibitionNo) {
		double starAvg = sqlSession.selectOne("exhibition.selectAvgStar",exhibitionNo);
		return starAvg;
	}

	public int exhibitionUpdate(Exhibition ex) {
		int result = sqlSession.update("exhibition.exhibitionUpdate",ex);
		return result;
	}

	public ArrayList<Exhibition> selectExhibitionAdmin() {
		List<Exhibition> list = sqlSession.selectList("exhibition.selectExhibitionAdmin");
		return (ArrayList<Exhibition>)list;
	}

	public ArrayList<Exhibition> selectExhibitionAdminLast() {
		List<Exhibition> last = sqlSession.selectList("exhibition.selectExhibitionAdminLast");
		return (ArrayList<Exhibition>)last;
	}
}
