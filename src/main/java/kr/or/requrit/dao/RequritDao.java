package kr.or.requrit.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.requrit.vo.Requrit;
import kr.or.requrit.vo.RequritPageData;

@Repository
public class RequritDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int requritInsert(Requrit r) {
		int result = sqlSession.insert("requrit.requritInsert",r);
		return result;
	}

	public ArrayList<Requrit> selectRequritList(RequritPageData paging) {
		List<Requrit> list = sqlSession.selectList("requrit.selectRequritList",paging);
		return (ArrayList<Requrit>)list;
	}
}
