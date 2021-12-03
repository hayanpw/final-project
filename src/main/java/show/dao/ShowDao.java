package show.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import show.vo.Seat;
import show.vo.Show;
import show.vo.ShowReserv;
import show.vo.ShowReview;

@Repository
public class ShowDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Show> selectShowList() {
		List<Show> list = sqlSession.selectList("show.showList");
		return (ArrayList<Show>)list;
	}

	public Show selectOneShow(int showNo) {
		return sqlSession.selectOne("show.selectOneShow", showNo);
	}

	public double showStarAvg(int showNo) {
		return sqlSession.selectOne("show.starAvg", showNo);
	}

	public int insertShow(Show s) {
		return sqlSession.insert("show.insertShow", s);
	}

	public int deleteShow(int showNo) {
		return sqlSession.delete("show.deleteShow", showNo);
	}

	public int updateShow(Show s) {
		return sqlSession.update("show.updateShow", s);
	}

	public ArrayList<ShowReview> selectReivewList(int showNo) {
		List list = sqlSession.selectList("show.selectReviewList", showNo); 
		return (ArrayList<ShowReview>)list;
	}

	public int deleteReview(ShowReview sr) {
		return sqlSession.delete("show.deleteReview", sr);
	}

	public int insertReview(ShowReview sr) {
		return sqlSession.insert("show.insertReview", sr);
	}

	public int updateReview(ShowReview sr) {
		return sqlSession.update("show.updateReview", sr);
	}

	public int insertSeat(Seat s) {
		return sqlSession.insert("show.insertSeat", s);
	}

	public int insertReserv(ShowReserv sr) {
		return sqlSession.insert("show.insertReserv", sr);
	}
}
