package kr.co.salmal.domain;

public class Criteria {//페이징 처리에 필요한 vo
	
	private int pageNum;
	private int amount;
	private String categoryName;
	private String articleHeader;
	private String articleTitle;
	private int productCnt;
	
	
	public Criteria() {

		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getArticleHeader() {
		return articleHeader;
	}

	public void setArticleHeader(String articleHeader) {
		this.articleHeader = articleHeader;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", categoryName=" + categoryName
				+ ", articleHeader=" + articleHeader + ", articleTitle=" + articleTitle + ", productCnt=" + productCnt
				+ "]";
	}
	
	
	
	
}
