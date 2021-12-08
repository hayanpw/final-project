package kr.or.exhibition.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.exhibition.dao.ExhibitionDao;
import kr.or.exhibition.vo.Exhibition;
import kr.or.exhibition.vo.ExhibitionPayment;

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
}
