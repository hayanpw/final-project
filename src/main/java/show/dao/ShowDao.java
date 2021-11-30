package show.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import show.vo.Show;

@Repository
public class ShowDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Show> selectShowList() {
		List<Show> list = sqlSession.selectList("show.showList");
		return (ArrayList<Show>)list;
	}

	public Show selectOneShow(int showNo) {
		return sqlSession.selectOne("show.showView", showNo);
	}

	public double showStarAvg(int showNo) {
		return sqlSession.selectOne("show.starAvg", showNo);
	}

	public int insertShow(Show s) {
		return sqlSession.insert("show.insertShow", s);
	}
}
