package kr.or.space.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
