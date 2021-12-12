package kr.or.exhibition.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.exhibition.dao.ExhibitionDao;
import kr.or.exhibition.vo.Exhibition;
import kr.or.exhibition.vo.ExhibitionPagingVo;
import kr.or.exhibition.vo.ExhibitionPayment;
import kr.or.exhibition.vo.ExhibitionReview;

@Service
public class ExhibitionService {
	
	@Autowired
	private ExhibitionDao dao;

	public int exhibitionInsert(Exhibition exb) {
		int result = dao.exhibitionInsert(exb);
		return result;
	}

	public Exhibition selectOneExhibition(int exhibitionNo) {
		Exhibition exb = dao.selectOneExhibition(exhibitionNo);
		return exb;
	}

	public int exhibitionCredit(ExhibitionPayment exbp) {
		int result = dao.exhibitionCredit(exbp);
		return result;
	}

	public int exhibitionTotal() {
		int totalCount = dao.exhibitionTotal();
		return totalCount;
	}

	public ArrayList<Exhibition> selectExhibitionList(int reqPage) {
		int end = reqPage;
		int start = end -3;
		ExhibitionPagingVo ep = new ExhibitionPagingVo();
		ep.setStart(start);
		ep.setEnd(end);
		ArrayList<Exhibition> list = dao.selectExhibition(ep);
		return list;
	}

	public ArrayList<Exhibition> moreExhibition(int start) {
		int end = start +2;
		ExhibitionPagingVo ep = new ExhibitionPagingVo();
		ep.setStart(start+1);
		ep.setEnd(end);
		ArrayList<Exhibition> list = dao.selectExhibition(ep);
		return list;
	}

	public int insertExReview(ExhibitionReview exr) {
		int result = dao.insertExReview(exr);
		return result;
	}
}
