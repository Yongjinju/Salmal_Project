package kr.co.salmal.persistence;

import kr.co.salmal.domain.MemberVO;

public interface MemberDAO {
	
	public String selectLogin(String email);
	public void insert(MemberVO member);
//	public void update(MemberVO member);
	public void delete(String email);
	public String selectlogNum(String email);
	public MemberVO selectMemberInfo(int memberNum);
	
}
