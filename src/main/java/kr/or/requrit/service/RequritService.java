package kr.or.requrit.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.requrit.dao.RequritDao;
import kr.or.requrit.vo.Requrit;
import kr.or.requrit.vo.RequritPageData;
import kr.or.requrit.vo.RequritPagingVo;


@Service
public class RequritService {
	@Autowired
	private RequritDao dao;

	public int requritInsert(Requrit r) {
		int result = dao.requritInsert(r);
		return result;
	}

	public ArrayList<Requrit> selectRequritList() {
		ArrayList<Requrit> list = dao.selectRequritList();
		return null;
	}

	public RequritPageData selectRequritPageData(int reqPage) {
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		RequritPagingVo paging = new RequritPagingVo();
		paging.setEnd(end);
		paging.setStart(start);
		ArrayList<Requrit> list = dao.selectRequritList(paging);
		return null;
	}
}
