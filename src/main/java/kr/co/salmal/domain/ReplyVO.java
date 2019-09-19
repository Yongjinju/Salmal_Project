package kr.co.salmal.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private int replyNum;
	private int memberNum;
	private int productNum;
	private String replyContent;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date replyDate;
	private int choice;
	private String nickname;
	private int parentNum;
	private int depth;

	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int replyNum, int memberNum, int productNum, String replyContent, Date replyDate, int choice,
			String nickname, int parentNum, int depth) {
		super();
		this.replyNum = replyNum;
		this.memberNum = memberNum;
		this.productNum = productNum;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.choice = choice;
		this.nickname = nickname;
		this.parentNum = parentNum;
		this.depth = depth;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getParentNum() {
		return parentNum;
	}

	public void setParentNum(int parentNum) {
		this.parentNum = parentNum;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", memberNum=" + memberNum + ", productNum=" + productNum
				+ ", replyContent=" + replyContent + ", replyDate=" + replyDate + ", choice=" + choice + ", nickname="
				+ nickname + ", parentNum=" + parentNum + ", depth=" + depth + "]";
	}

}
