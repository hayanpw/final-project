package kr.or.exhibition.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		double starAvg = dao.selectStarAvg(exhibitionNo);
		exb.setStarAvg(starAvg);
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
	public int deleteExReview(ExhibitionReview exr) {
		int result = dao.deleteExReview(exr);
		return result;
	}

	public int updateExReview(ExhibitionReview exr) {
		int result = dao.updateExReview(exr);
		return result;
	}

	public ArrayList<ExhibitionReview> selectListExReview(int exhibitionNo) {
		ArrayList<ExhibitionReview> list = dao.selectExReview(exhibitionNo);
		return list;
	}
	@Transactional
	public int exhibitionUpdate(Exhibition ex) {
		int result = dao.exhibitionUpdate(ex);
		return result;
	}

	public HashMap<String, Object> selectExhibitionAdmin() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Exhibition> list = dao.selectExhibitionAdmin();
		ArrayList<Exhibition> last = dao.selectExhibitionAdminLast();
		map.put("list", list);
		map.put("last", last);
		return map;
	}

	public int checkTotalCount(String exhibitionDate, int exhibitionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("exhibitionDate", exhibitionDate);
		map.put("exhibitionNo", exhibitionNo);
		int totalCount = dao.checkTotalCount(map);
		System.out.println(totalCount);
		return totalCount;
	}

	public HashMap<String, Object> selectExhibitionPaymentList(int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ExhibitionPayment>  list = dao.selectExhibitionPaymentList(memberNo);
		ArrayList<ExhibitionPayment> last = dao.selectExhibitionPaymentListLast(memberNo);
		int totalCount = last.size();
		map.put("list", list);
		map.put("last", last);
		map.put("totalCount", totalCount);
		return map;
	}
	@Transactional
	public int deletePayment(long paymentNo) {
		int result = dao.deletePayment(paymentNo);
		return result;
	}
}
