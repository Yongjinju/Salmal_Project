package kr.co.salmal.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private int memberNum;
	private String email;
	private String nickname;
	private String password;
	private String gender;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	private Date joinDate;
	
	

	
	public MemberVO() {
		super();
	}
	public MemberVO(int memberNum, String email, String nickname, String password, String gender, Date birth,
			Date joinDate) {
		super();
		this.memberNum = memberNum;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.gender = gender;
		this.birth = birth;
		this.joinDate = joinDate;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", email=" + email + ", nickname=" + nickname + ", password="
				+ password + ", gender=" + gender + ", birth=" + birth + ", joinDate=" + joinDate + "]";
	}
	
	
	
	
	
}
