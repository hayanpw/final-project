package kr.or.requrit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.requrit.dao.RequritDao;
import kr.or.requrit.vo.Requrit;


@Service
public class RequritService {
	@Autowired
	private RequritDao dao;

	public int requritInsert(Requrit r) {
		int result = dao.requritInsert(r);
		return result;
	}
}
