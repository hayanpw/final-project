package kr.or.academy.service;

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
}
