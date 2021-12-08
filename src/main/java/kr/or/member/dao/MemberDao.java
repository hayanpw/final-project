package kr.or.member.dao;



import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;



import kr.or.member.vo.Member;


@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
	public Member selectOneMemberId(String memberId) {
		Member m = sqlSession.selectOne("member.selectOneId",memberId);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public Member selectOneMemberEmail(String memberEmail) {
		Member m = sqlSession.selectOne("member.selectOneEmail",memberEmail);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public Member selectOneMemberPw(String memberPassword) {
		Member m = sqlSession.selectOne("member.selectOnePw",memberPassword);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
	public int updateMember(Member member) {
		int result = sqlSession.update("member.updateMember",member);
		return result;
	}
	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member>)list;
	}
	public int searchidpw(Member member) {
		int result = sqlSession.update("member.searchidpw",member);
		return result;
	}
	
	public int updateMemberLevel(Member member) {
		int result = sqlSession.update("member.updateMemberLevel",member);
		return result;
	}
	public Member searchId(String memberEmail) {
		Member m = sqlSession.selectOne("member.searchId",memberEmail);
		if(m == null) {
			return null;
		}else {
			return m;
		}
	}
}

