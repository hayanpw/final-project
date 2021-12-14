package kr.or.academy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.academy.dao.AcademyDao;
import kr.or.academy.vo.Academy;
import kr.or.academy.vo.AcademyCategory;
import kr.or.academy.vo.AcademyPagingVo;
import kr.or.academy.vo.AcademyPayment;

@Service
public class AcademyService {

	@Autowired
	private AcademyDao dao;

	public int academyInsert(Academy a) {
		int result = dao.academyInsert(a);
		return result;
	}

	public int academyTotal() {
		int totalCount = dao.academyTotal();
		return totalCount;
	}

	public ArrayList<Academy> selectAcademyList(int reqPage ,String category) {
		int end = reqPage;
		int start = end - 3;
		AcademyPagingVo ap = new AcademyPagingVo();
		ap.setStart(start);
		ap.setEnd(end);
		ap.setCategory(category);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		System.out.println("시스템에서 마지막 카테고리:"+ap.getCategory());
		ArrayList<Academy> list = dao.selectAcademy(map);
		System.out.println("출력되는 리스트 길이:"+list.size());
		return list;
	}

	public ArrayList<Academy> moreAcademy(int start) {
		int end = start +2;
		AcademyPagingVo ap = new AcademyPagingVo();
		ap.setStart(start+1);
		ap.setEnd(end);
		ArrayList<Academy> list = dao.selectAcademy(ap);
		return list;
	}

	public Academy selectOneAcademy(int academyNo) {
		Academy a = dao.selectOneAcademy(academyNo);
		return a;
	}

	public int academyCredit(AcademyPayment acp) {
		int result = dao.academyCredit(acp);
		return result;
	}

	public ArrayList<AcademyCategory> selectAcademyCategory() {
		ArrayList<AcademyCategory> acList = dao.selectAcademyCategory();
		return acList;
	}

	public ArrayList<Academy> categoryAcademy(String category) {
		AcademyPagingVo ap = new AcademyPagingVo();
		ap.setStart(1);
		ap.setStart(2);
		ap.setCategory(category);
		int totalCount = dao.totalCountAcademy(category);
		ArrayList<Academy> list = dao.selectCategoryAcademy(category);
		return list;
	}
}
