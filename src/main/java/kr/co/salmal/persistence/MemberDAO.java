package kr.co.salmal.persistence;

import java.util.List;
import java.util.Map;
import kr.co.salmal.domain.MemberVO;

public interface MemberDAO {
	
	public String selectLogin(String email);
	public void insert(MemberVO member);
//	public void update(MemberVO member);
	public void delete(String email);
	public String selectlogNum(String email);
	public String selectNickname(String email);
	public MemberVO selectMemberInfo(int memberNum);
	
	public List<Map<String, Object>> selectMyArticlelist(String nickname);//내가 쓴 글 조회
	
}
