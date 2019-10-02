package kr.co.salmal.persistence;

import java.util.List;
import java.util.Map;
import kr.co.salmal.domain.MemberVO;

public interface MemberDAO {
	
	public String selectLogin(String email);
	public void insert(MemberVO member);
	public int update(MemberVO vo);
	public void delete(String email);
	public String selectlogNum(String email);
	public String selectNickname(String email);
	public MemberVO selectMemberInfo(int memberNum);
	
	public List<Map<String, Object>> selectMyArticlelist(int memberNum);//내가 쓴 글 조회
	public List<Map<String, Object>> selectArticleWithMyReply(int memberNum);//내가 쓴 글 조회
	
	public int selectPoint(int memberNum); //등급조회
	public int checkEmail(String email);
	public int checkNickname(String nickname);
	
}
