package kr.or.exhibition.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDao {
	@Autowired
	private SqlSession sqlSession;
}
