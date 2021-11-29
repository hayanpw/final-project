package kr.or.addition.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.addition.model.vo.Board;

@Repository
public class AdditionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Board> selectNoticeList(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("addition.noticeList",map);
		return (ArrayList<Board>)list;
	}

	public int totalCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("addition.totalCount",map);
	}
}
