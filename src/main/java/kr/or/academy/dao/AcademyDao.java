package kr.or.academy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcademyDao {

	@Autowired
	private SqlSession sqlSession;
}
