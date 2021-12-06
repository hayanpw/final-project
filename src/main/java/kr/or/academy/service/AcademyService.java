package kr.or.academy.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.academy.dao.AcademyDao;
import kr.or.academy.vo.Academy;

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
		ArrayList<Academy> list = dao.selectAcademy(reqPage);
		return list;
	}
}
