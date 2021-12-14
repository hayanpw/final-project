package kr.or.space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.space.model.service.SpaceService;

@Component
public class SpaceScheduled {
	@Autowired
	private SpaceService service;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void insertSpaceBlack() {
		System.out.println("공간 블랙리스트 등록");
		service.insertSpaceBlack();
		/* service.deleteSpaceBlack(); */
	}
	
}
