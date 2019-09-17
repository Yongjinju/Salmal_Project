package kr.co.salmal.domain;

import java.util.Date;

public class ArticleVO {
	
	/*
	articleNum NUMBER NOT NULL,
	memberNum NUMBER NOT NULL, 
	categoryNum NUMBER NOT NULL, 
	articleTitle VARCHAR2(100) NOT NULL,
	articleContent CLOB, 
	articleHits NUMBER NOT NULL,
	articleDate DATE NOT NULL
	 */
	
	private int articleNum;
	private int memberNum;
	private int categoryNum;
	private String articleTitle;
	private String articleContent;
	private int articleHits;
	private Date articleDate;
	
	public ArticleVO() {

	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public int getArticleHits() {
		return articleHits;
	}

	public void setArticleHits(int articleHits) {
		this.articleHits = articleHits;
	}

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}

	@Override
	public String toString() {
		return "ArticleVO [articleNum=" + articleNum + ", memberNum=" + memberNum + ", categoryNum=" + categoryNum
				+ ", articleTitle=" + articleTitle + ", articleContent=" + articleContent + ", articleHits="
				+ articleHits + ", articleDate=" + articleDate + "]";
	}

	
	

}
