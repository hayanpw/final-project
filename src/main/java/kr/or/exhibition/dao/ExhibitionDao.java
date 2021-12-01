package kr.or.exhibition.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
