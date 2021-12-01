package show.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.ShowDao;
import show.vo.Show;
import show.vo.ShowAndReview;
import show.vo.ShowReview;

@Service
public class ShowService {
	@Autowired
	private ShowDao dao;

	public ArrayList<Show> selectShowList() {
		return dao.selectShowList();
	}

	public Show selectOneShow(int showNo) {
		Show s = dao.selectOneShow(showNo);
		double star = dao.showStarAvg(showNo);
		star = Math.round(star*10.0)/10.0;
		s.setShowStar(star);
		return s;
	}

	public int insertShow(Show s) {
		return dao.insertShow(s);
	}

	public int deleteShow(int showNo) {
		return dao.deleteShow(showNo);
	}

	public int updateShow(Show s) {
		return dao.updateShow(s);
	}

	public ShowAndReview selectShowView(int showNo) {
		Show s = dao.selectOneShow(showNo);
		double star = dao.showStarAvg(showNo);
		star = Math.round(star*10.0)/10.0;
		s.setShowStar(star);
		ArrayList<ShowReview> list = dao.selectReivewList(showNo);
		ShowAndReview snr = new ShowAndReview();
		snr.setS(s);
		snr.setList(list);
		return snr;
	}

	public int deleteReview(ShowReview sr) {
		return dao.deleteReview(sr);
	}

	public int insertReview(ShowReview sr) {
		return dao.insertReview(sr);
	}

	public int updateReview(ShowReview sr) {
		return dao.updateReview(sr);
	}

}
