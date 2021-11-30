package kr.or.space.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.space.model.vo.FileVO;
import kr.or.space.model.vo.Space;

@Repository
public class SpaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공간 등록
	public int insertSpace(Space s) {
		return sqlSession.insert("space.insertSpace",s);
	}
	//전체 공간 조회
	public ArrayList<Space> selectAllSpace() {
		List<Space> list = sqlSession.selectList("space.selectAllSpace");
		return (ArrayList<Space>)list;
	}
	//파일을 업로드 한 게시물
	public int selectSpaceNo() {
		int result = sqlSession.selectOne("space.selectSpaceNo");
		return result;
	}
	//파일 등록
	public int insertFile(FileVO fv) {
		int result = sqlSession.insert("space.insertFile",fv);
		return result;
	}
}
