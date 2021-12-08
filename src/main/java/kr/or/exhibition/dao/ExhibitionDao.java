package kr.or.exhibition.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.exhibition.vo.Exhibition;

@Repository
public class ExhibitionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int exhibitionInsert(Exhibition exb) {
		int result = sqlSession.insert("exhibition.exhibitionInsert",exb);
		return result;
	}

	public Exhibition selectOneExhibition(int exhibitionNo) {
		Exhibition exb = sqlSession.selectOne("exhibition.selectOneExhibition",exhibitionNo);
		return exb;
	}
}
