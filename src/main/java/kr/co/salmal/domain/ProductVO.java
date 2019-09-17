package kr.co.salmal.domain;

public class ProductVO {
	
	private int productNum;
	private int articleNum;
	private String productName;
	private String productLink;
	private String productImage;
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}

	public ProductVO(int productNum, int articleNum, String productName, String productLink, String productImage) {
		super();
		this.productNum = productNum;
		this.articleNum = articleNum;
		this.productName = productName;
		this.productLink = productLink;
		this.productImage = productImage;
	}



	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	@Override
	public String toString() {
		return "ProductVO [productNum=" + productNum + ", articleNum=" + articleNum + ", productName=" + productName
				+ ", productLink=" + productLink + ", productImage=" + productImage + "]";
	}
	
	
}
