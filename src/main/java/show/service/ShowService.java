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
}
