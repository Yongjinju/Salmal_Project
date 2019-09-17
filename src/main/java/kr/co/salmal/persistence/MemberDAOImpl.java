package kr.co.salmal.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.salmal.domain.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectLogin(String email) {
		return sqlSession.selectOne("member.selectLogin",email);
	}

	@Override
	public void insert(MemberVO member) {
		 sqlSession.insert("member.insert",member);
	}

//	@Override
//	public void update(MemberVO member) {
//		 sqlSession.update("member.update",member);
//
//	}

	@Override
	public void delete(String email) {
		 sqlSession.delete("member.delete",email);

	}

	@Override
	public String selectlogNum(String email) {
		return sqlSession.selectOne("member.selectlogNum",email);
	}

	@Override
	public MemberVO selectMemberInfo(int memberNum) {
		return sqlSession.selectOne("member.selectMemberInfo", memberNum);
	}

}
