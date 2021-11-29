package kr.or.space.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.space.model.vo.Space;

@Repository
public class SpaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertSpace(Space s) {
		return sqlSession.insert("space.insertSpace",s);
	}

	public ArrayList<Space> selectAllSpace() {
		List<Space> list = sqlSession.selectList("space.selectAllSpace");
		return (ArrayList<Space>)list;
	}
}
