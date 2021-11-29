package kr.or.reading.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.reading.model.dao.ReadingDao;
import kr.or.reading.model.vo.ReadingBlack;

@Service
public class ReadingService {

	@Autowired
	private ReadingDao dao;


	public ReadingBlack selectOneBlackList(String memberId) {
		ReadingBlack rb = dao.selectOneBlackList(memberId);
		return rb;
	}
}
