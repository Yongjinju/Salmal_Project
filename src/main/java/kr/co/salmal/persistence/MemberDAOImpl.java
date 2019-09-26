package kr.co.salmal.persistence;

import java.util.List;
import java.util.Map;
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

	@Override
	public int update(MemberVO vo) {
		 return sqlSession.update("member.update",vo);

	}

	@Override
	public void delete(String email) {
		 sqlSession.delete("member.delete",email);

	}

	@Override
	public String selectlogNum(String email) {
		return sqlSession.selectOne("member.selectlogNum",email);
	}
	
	@Override
	public String selectNickname(String email) {
		return sqlSession.selectOne("member.selectNickname",email);
	}

	@Override
	public MemberVO selectMemberInfo(int memberNum) {
		return sqlSession.selectOne("member.selectMemberInfo", memberNum);
	}

	//내가 쓴 글 조회
	@Override
	public List<Map<String, Object>> selectMyArticlelist(String nickname) {
		return sqlSession.selectList("member.selectMyArticle", nickname);
	}
	
	//내가 댓글을 쓴 글 조회
	@Override
	public List<Map<String, Object>> selectArticleWithMyReply(int memberNum) {
		return sqlSession.selectList("member.selectArticleWithMyReply", memberNum);
	}
	
	//등급조회
	@Override
	public int selectPoint(int memberNum) {
		return sqlSession.selectOne("member.selectPoint", memberNum);

	}

	@Override
	public int checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail", email);
	}

	@Override
	public int checkNickname(String nickname) {
		return sqlSession.selectOne("member.checkNickname", nickname);
	}


}
