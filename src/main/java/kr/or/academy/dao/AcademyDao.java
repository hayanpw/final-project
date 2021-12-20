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
	//전체 리스트 최신순 출력
	public ArrayList<Academy> selectAcademy(AcademyPagingVo ap) {
		System.out.println("전체 리스트  출력 dao");
		System.out.println("카테고리:"+ap.getCategory());
		System.out.println("스타트:"+ap.getStart()+"엔드"+ap.getEnd());
		List<Academy> list = sqlSession.selectList("academy.academyList",ap);
		System.out.println("조회해온 list 길이"+list.size());
		return (ArrayList<Academy>)list;
	}
	//카테고리별 최신순 출력
	public ArrayList<Academy> selectCategoryAcademy(AcademyPagingVo ap) {
		System.out.println("카테고리 리스트  출력 dao");
		System.out.println("카테고리:"+ap.getCategory());
		System.out.println("스타트:"+ap.getStart()+"엔드"+ap.getEnd());
		List<Academy> list = sqlSession.selectList("academy.selectCategoryList",ap);
		System.out.println("조회해온 list 길이"+list.size());
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
		System.out.println("카테고리별 전체 개시글 조회");
		int totalCount = sqlSession.selectOne("academy.totalCountAcademy",category);
		return totalCount;
	}

	public ArrayList<Academy> searchAcademyList(AcademyPagingVo ap) {
		System.out.println("검색 최신순 실행");
		System.out.println("검색어:"+ap.getCategory());
		System.out.println("스타트:"+ap.getStart()+"엔드"+ap.getEnd());
		List<Academy> list = sqlSession.selectList("academy.searchAcademyList",ap);
		return (ArrayList<Academy>)list;
	}

	public int searchAcademyTotal(String keyWord) {
		System.out.println(keyWord);
		int totalCount = sqlSession.selectOne("academy.searchAcademyTotal",keyWord);
		System.out.println(totalCount);
		return totalCount;
	}

	public int academyUpdate(Academy a) {
		int result = sqlSession.update("academy.academyUpdate",a);
		return result;
	}

	public ArrayList<Academy> acadeyAdminList() {
		List<Academy> list = sqlSession.selectList("academy.academtAdminList");
		return (ArrayList<Academy>)list;
	}

	public ArrayList<Academy> academyAdminListLast() {
		List<Academy> last = sqlSession.selectList("academy.academtAdminListLast");
		return (ArrayList<Academy>)last;
	}

	public int countingStar(int academyNo) {
		int studentCount = sqlSession.selectOne("academy.countingStar",academyNo);
		System.out.println(studentCount);
		return studentCount;
	}

	public ArrayList<AcademyPayment> selecAcademtPaymentList(int memberNo) {
		List<AcademyPayment> list = sqlSession.selectList("academy.selecAcademtPaymentList",memberNo);
		return (ArrayList<AcademyPayment>)list;
	}

	public ArrayList<AcademyPayment> selecAcademtPaymentListLast(int memberNo) {
		List<AcademyPayment> last = sqlSession.selectList("academy.selecAcademtPaymentListLast",memberNo);
		return (ArrayList<AcademyPayment>)last;
	}

	public int deleteAcPayment(long paymentNo) {
		int result = sqlSession.update("academy.deleteAcPayment",paymentNo);
		return result;
	}

	//public int academyUpdate(Academy a) {
	//	int result = sqlSession.update("academy.academyUpdate",a);
	//	return result;
	//}
}
