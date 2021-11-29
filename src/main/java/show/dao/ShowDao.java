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
		List<Show> list = sqlSession.selectList("show.ShowList");
		return (ArrayList<Show>)list;
	}
}
