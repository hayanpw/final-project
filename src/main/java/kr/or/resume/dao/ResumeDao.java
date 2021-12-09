package kr.or.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumeTbl;

@Repository
public class ResumeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertResume(Resume r) {
		int result = sqlSession.insert("resume.insertResume",r);
		return result;
	}

	public int selectBoardNo() {
		int result = sqlSession.selectOne("resume.selectResumeNo");
		return result;
	}

	public int insertResumeTbl(ResumeTbl rt) {
		int result = sqlSession.insert("resume.insertResumeTbl",rt);
		return result;
	}
}
