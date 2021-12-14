package kr.or.academy.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.academy.vo.Academy;
import kr.or.academy.vo.AcademyCategory;
import kr.or.academy.vo.AcademyPagingVo;
import kr.or.academy.vo.AcademyPayment;

@Repository
public class AcademyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int academyInsert(Academy a) {
		int result = sqlSession.insert("academy.academyInsert",a);
		return result;
	}

	public int academyTotal() {
		int totalCount = sqlSession.selectOne("academy.acadeyTotal");
		return totalCount;
	}

	public ArrayList<Academy> selectAcademy(HashMap<String, Object> map) {
		//System.out.println("dao에서 찍히는 ap 에있는 카테고리:"+ap.getCategory());
		//System.out.println(ap.getStart());
		//System.out.println(ap.getEnd());
		List<Academy> list = sqlSession.selectList("academy.academyList",map);
		System.out.println("sql지나온 곧바로"+list.size());
		return (ArrayList<Academy>)list;
	}

	public Academy selectOneAcademy(int academyNo) {
		Academy a = sqlSession.selectOne("academy.selectOneAcademy",academyNo);
		return a;
	}

	public int academyCredit(AcademyPayment acp) {
		int result = sqlSession.insert("academy.academyCredit",acp);
		return result;
	}

	public ArrayList<AcademyCategory> selectAcademyCategory() {
		List<AcademyCategory> acList = sqlSession.selectList("academy.academyCategory");
		return (ArrayList<AcademyCategory>)acList;
	}

	public int totalCountAcademy(String category) {
		int totalCount = sqlSession.selectOne("academy.totalCountAcademy",category);
		return totalCount;
	}

	public ArrayList<Academy> selectCategoryAcademy(String category) {
		List<Academy> list = sqlSession.selectList("academy.selectCategoryList",category);
		return (ArrayList<Academy>)list;
	}
}
