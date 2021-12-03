package kr.or.academy.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.academy.vo.Academy;

@Repository
public class AcademyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int academyInsert(Academy a) {
		int result = sqlSession.insert("academy.academyInsert",a);
		return result;
	}
}
