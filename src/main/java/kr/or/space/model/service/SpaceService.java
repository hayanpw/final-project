package kr.or.space.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.space.model.dao.SpaceDao;

@Service
public class SpaceService {
	@Autowired
	private SpaceDao dao;
}
