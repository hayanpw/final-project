package show.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import show.dao.ShowDao;
import show.vo.Seat;
import show.vo.Show;
import show.vo.ShowAndReview;
import show.vo.ShowReserv;
import show.vo.ShowReview;

@Service
public class ShowService {
	@Autowired
	private ShowDao dao;

	public ArrayList<Show> selectShowList() {
		dao.payCancel();
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

	public Show reservation(Seat s, String memberId) {
		ShowReserv sr = new ShowReserv();
		sr.setShowNo(s.getShowNo());
		sr.setMemberId(memberId);
		sr.setShowDate(s.getShowDate());
		int result = dao.insertReserv(sr);
		s.setReservNo(sr.getReservNo());
		
		for(int i=0; i<s.getSeatList().size(); i++) {
			s.setSeatNo(s.getSeatList().get(i));
			result = dao.insertSeat(s);
		}
		
		Show show = null;
		if(result>0) {
			show = dao.selectOneShow(s.getShowNo());
		}
		
		return show;
	}

	public int deleteReserv(int reservNo) {
		int result = dao.deleteReserv(reservNo);
		result = dao.deleteSeat(reservNo);
		return result;
	}

	public HashMap<String, Object> selectReservation(int reservNo) {
		dao.updateReserv(reservNo);
		ShowReserv sr = dao.selectReserv(reservNo);
		Show show = dao.selectOneShow(sr.getShowNo());
		ArrayList<Seat> list = dao.selectSeatList(reservNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sr", sr);
		map.put("show", show);
		map.put("list", list);
		return map;
	}

	public HashMap<String, Object> checkSeatList(ShowReserv sr) {
		Show show = dao.selectOneShow(sr.getShowNo());
		ArrayList<Seat> list = dao.selectAllSeat(sr);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("show", show);
		map.put("list", list);
		return map;
	}

	public String selectOneSeat(Seat s) {
		return dao.selectOneSeat(s);
	}

}
