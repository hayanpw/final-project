package kr.or.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
