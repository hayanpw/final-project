package kr.or.academy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.academy.dao.AcademyDao;
import kr.or.academy.vo.Academy;
import kr.or.academy.vo.AcademyCategory;
import kr.or.academy.vo.AcademyPagingVo;
import kr.or.academy.vo.AcademyPayment;
import kr.or.academy.vo.StudentList;

@Service
public class AcademyService {

	@Autowired
	private AcademyDao dao;

	public int academyInsert(Academy a) {
		int result = dao.academyInsert(a);
		return result;
	}

	public int academyTotal() {
		System.out.println("전체 토탈 구하기");
		int totalCount = dao.academyTotal();
		return totalCount;
	}

	public ArrayList<Academy> selectAcademyList(int reqPage ,String category) {
		System.out.println("리스트 서비스");
		String all = "all";
		int end = reqPage;
		int start = end - 3;
		AcademyPagingVo ap = new AcademyPagingVo();
		if(category.equals(all)) {
			System.out.println("전체선택");
			ap.setStart(start);
			ap.setEnd(end);
			ap.setCategory(category);
			ArrayList<Academy> list = dao.selectAcademy(ap);
			System.out.println("출력되는 리스트 길이:"+list.size());
			return list;
		}else {
			System.out.println("카테고리선택");
			ap.setStart(start);
			ap.setEnd(end);
			ap.setCategory(category);
			int totalCount = dao.totalCountAcademy(category);
			System.out.println("전체 카운트"+totalCount);
			ArrayList<Academy> list = dao.selectCategoryAcademy(ap);
			for(Academy a : list) {
				a.setTotalCount(totalCount);
			}
			System.out.println("출력되는 리스트 길이:"+list.size());
			return list;
		}
	}
	//더보기
	public ArrayList<Academy> moreAcademy(int start,String category) {
		start = start+1;
		int end = start +1;
		String all = "all";
		AcademyPagingVo ap = new AcademyPagingVo();
		if(category.equals(all)) {
			System.out.println("전체선택(더보기)");
			ap.setStart(start);
			ap.setEnd(end);
			ap.setCategory(category);
			ArrayList<Academy> list = dao.selectAcademy(ap);
			System.out.println("더보기로 출력되는 리스트 길이:"+list.size());
			return list;
		}else {
			System.out.println("카테고리선택(더보기)");
			ap.setStart(start);
			ap.setEnd(end);
			ap.setCategory(category);
			ArrayList<Academy> list = dao.selectCategoryAcademy(ap);
			System.out.println("더보기로 출력되는 리스트 길이:"+list.size());
			return list;
		}
	}
	//검색으로 조회 처음에 4개 해오기
	public ArrayList<Academy> searchAcademyList(int reqPage, String keyWord) {
		System.out.println("검색으로 리스트 보기 서비스");
		int end = reqPage;
		int start = end - 3;
		ArrayList<Academy> list = new ArrayList<Academy>();
		if(keyWord.equals("")) {
			System.out.println("검색어가 없습니다.");
			return list;
		}else {
			AcademyPagingVo ap = new AcademyPagingVo();
			ap.setStart(start);
			ap.setEnd(end);
			ap.setCategory(keyWord);
			System.out.println("검색 실행");
			list = dao.searchAcademyList(ap);
			if(list.size() < 1) {
				System.out.println("검색결과 없음");
				return list;
			}else {
				System.out.println("검색결과 있음");
				int totalCount = dao.searchAcademyTotal(keyWord);
				for(Academy a : list) {
					a.setTotalCount(totalCount);
				}
				return list;
			}
		}
	}
	public Academy selectOneAcademy(int academyNo) {
		Academy a = dao.selectOneAcademy(academyNo);
		return a;
	}

	public int academyCredit(AcademyPayment acp) {
		int result = dao.academyCredit(acp);
		return result;
	}

	public ArrayList<AcademyCategory> selectAcademyCategory() {
		ArrayList<AcademyCategory> acList = dao.selectAcademyCategory();
		return acList;
	}
	public ArrayList<Academy> searchMoreAcademy(int start, String category) {
		System.out.println("검색결과 더보기");
		start = start+1;
		int end = start +1;
		AcademyPagingVo ap = new AcademyPagingVo();
		ap.setCategory(category);
		ap.setEnd(end);
		ap.setStart(start);
		ArrayList<Academy> list = dao.searchAcademyList(ap);
		return list;
	}

	public int academyUpdate(Academy a) {
		int result = dao.academyUpdate(a);
		return result;
	}

	public HashMap<String, Object> academyAdminList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Academy> list = dao.acadeyAdminList();
		ArrayList<Academy> last = dao.academyAdminListLast();
		map.put("list", list);
		map.put("last", last);
		return map;
	}

	public int countingStar(int academyNo) {
		int studentCount = dao.countingStar(academyNo);
		System.out.println(studentCount);
		return studentCount;
	}

	public HashMap<String, Object> academyMypage(int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AcademyPayment> list = dao.selecAcademtPaymentList(memberNo);
		ArrayList<AcademyPayment> last = dao.selecAcademtPaymentListLast(memberNo);
		int totalCount = last.size();
		map.put("list",list);
		map.put("last",last);
		map.put("totalCount",totalCount);
		return map;
	}
	@Transactional
	public int deleteAcPayment(int paymentNo) {
		int result = dao.deleteAcPayment(paymentNo);
		return result;
	}

	public ArrayList<StudentList> studentViewList(int academyNo) {
		ArrayList<StudentList> list = dao.studentViewList(academyNo);
		return list;
	}

}
