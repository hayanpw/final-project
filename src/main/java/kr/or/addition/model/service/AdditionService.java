package kr.or.addition.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.addition.model.dao.AdditionDao;

@Service
public class AdditionService {
	@Autowired
	private AdditionDao dao;
}
