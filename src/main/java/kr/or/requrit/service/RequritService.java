package kr.or.requrit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.requrit.dao.RequritDao;


@Service
public class RequritService {
	@Autowired
	private RequritDao dao;
}
