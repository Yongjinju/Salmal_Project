package kr.co.salmal.domain;

import java.util.Date;

public class ArticleForSelectVO {

	private int articleNum;
	private int memberNum;
	private String articleTitle;
	private String categoryName;
	private int articleHits;
	private String productName;
	private String productNum;
	private String productLink;
	private String productImage;
	private String nickName;
	private String gender;
	private Date birth;
	private Date articleDate;
	private String articleContent;
	
	public ArticleForSelectVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getMemberNum() {
		return memberNum;
	}
	
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getArticleHits() {
		return articleHits;
	}

	public void setArticleHits(int articleHits) {
		this.articleHits = articleHits;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getProductLink() {
		return productLink;
	}

	public void setProductLink(String productLink) {
		this.productLink = productLink;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	@Override
	public String toString() {
		return "ArticleForSelectVO [articleNum=" + articleNum + ", articleTitle=" + articleTitle + ", categoryName="
				+ categoryName + ", articleHits=" + articleHits + ", productName=" + productName + ", productNum="
				+ productNum + ", productLink=" + productLink + ", productImage=" + productImage + ", nickName="
				+ nickName + ", gender=" + gender + ", birth=" + birth + ", articleDate=" + articleDate
				+ ", articleContent=" + articleContent + "]";
	}
	
	
	
}
