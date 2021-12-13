package kr.or.academy.dao;


import java.util.ArrayList;
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

	public ArrayList<Academy> selectAcademy(AcademyPagingVo ap) {
		List<Academy> list = sqlSession.selectList("academy.academyList",ap);
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
}
