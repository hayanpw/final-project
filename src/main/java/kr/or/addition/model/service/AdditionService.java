package kr.or.addition.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.addition.model.dao.AdditionDao;
import kr.or.addition.model.vo.Board;

@Service
public class AdditionService {
	@Autowired
	private AdditionDao dao;

	public ArrayList<Board> selectNoticeList(int boardType) {
		ArrayList<Board> list = dao.selectNoticeList(boardType);
		return list;
	}
}
