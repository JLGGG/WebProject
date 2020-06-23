package cart;

import java.io.Serializable;

public class Product implements Serializable {
	private String productID; //상품 아이디
	private String productName; //상품 이름
	private Integer unitPrice; //상품 가격
	private String description; //상품 설명
	private String condition; //중고품 표시
	private String userId; // 판매자 이름
	private int quantity; //장바구니에 담긴 상품 개수
	private String fileName; //이미지 파일명
	private int sellCondition;
	
	public Product(String productID, String productName, Integer unitPrice) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.unitPrice = unitPrice;
	}
	public Product() {
		super();
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getSellCondition() {
		return sellCondition;		
	}
	public void setSellCondition(int sellCondition) {
		this.sellCondition=sellCondition;
	}
	
}
