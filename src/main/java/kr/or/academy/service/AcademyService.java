package kr.or.academy.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.academy.dao.AcademyDao;
import kr.or.academy.vo.Academy;
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

	public ArrayList<Academy> selectAcademyList(int reqPage) {
		int end = reqPage;
		int start = end - 3;
		AcademyPagingVo ap = new AcademyPagingVo();
		ap.setStart(start);
		ap.setEnd(end);
		ArrayList<Academy> list = dao.selectAcademy(ap);
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
}
