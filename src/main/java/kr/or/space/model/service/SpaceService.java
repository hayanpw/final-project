package kr.or.space.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.space.model.dao.SpaceDao;
import kr.or.space.model.vo.Space;

@Service
public class SpaceService {
	@Autowired
	private SpaceDao dao;

	public int insertSpace(Space s) {
		return dao.insertSpace(s);
	}

	public ArrayList<Space> selectAllSpace() {
		ArrayList<Space> list = dao.selectAllSpace();
		return list;
	}
}
