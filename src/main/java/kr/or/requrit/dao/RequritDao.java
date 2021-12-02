package kr.or.requrit.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.requrit.vo.Requrit;

@Repository
public class RequritDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int requritInsert(Requrit r) {
		int result = sqlSession.insert("requrit.requritInsert",r);
		return result;
	}
}
