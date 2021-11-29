package show.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.ShowDao;
import show.vo.Show;

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
}
