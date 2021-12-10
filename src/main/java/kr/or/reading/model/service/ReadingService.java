package kr.or.reading.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.reading.model.dao.ReadingDao;
import kr.or.reading.model.vo.Reading;
import kr.or.reading.model.vo.ReadingBlack;

@Service
public class ReadingService {

	@Autowired
	private ReadingDao dao;


	public ReadingBlack selectOneBlackList(String memberId) {
		ReadingBlack rb = dao.selectOneBlackList(memberId);
		return rb;
	}


	public Reading selectOneNum(Reading re) {
		Reading re1 = dao.selectOneNum(re);
		return re1;
	}


	public int insertReading(Reading re) {
		return dao.insertReading(re);
	}


	public Reading selectOneId(Reading re) {
		Reading re2 = dao.selectOneId(re);
		return re2;
	}


	public int reservationCancel(Reading re) {
		return dao.reservationCancel(re);
	}


	public int countSeat(String readingDay) {
		return dao.countSeat(readingDay);
	}


	public ArrayList<Integer> chkSeat(Reading re) {
		ArrayList<Integer> list = dao.chkSeat(re);
		return list;
	}


	public ArrayList<Reading> selectAllReading() {
		ArrayList<Reading> list = dao.selectAllReading();
		return list;
	}


}
