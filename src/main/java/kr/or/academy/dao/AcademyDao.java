package kr.or.academy.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcademyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
