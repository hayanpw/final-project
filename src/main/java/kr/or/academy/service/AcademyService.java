package kr.or.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.academy.dao.AcademyDao;

@Service
public class AcademyService {

	@Autowired
	private AcademyDao dao;
}
