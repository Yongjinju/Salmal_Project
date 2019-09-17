package kr.co.salmal.domain;

public class RatingVO {
	
	private int productNum;
	private int memberNum;
	private int choice;
	
	
	
	
	
	public RatingVO() {
		super();
	}
	public RatingVO(int productNum, int memberNum, int choice) {
		super();
		this.productNum = productNum;
		this.memberNum = memberNum;
		this.choice = choice;
	}
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	
	

	

}
