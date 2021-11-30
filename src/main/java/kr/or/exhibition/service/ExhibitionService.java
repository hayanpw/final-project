package kr.or.exhibition.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.exhibition.dao.ExhibitionDao;

@Service
public class ExhibitionService {
	
	@Autowired
	private ExhibitionDao dao;
}
