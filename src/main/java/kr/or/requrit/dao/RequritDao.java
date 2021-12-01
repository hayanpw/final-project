package kr.or.requrit.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequritDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
