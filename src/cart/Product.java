package cart;

import java.io.Serializable;

public class Product implements Serializable {
	private String productID; //��ǰ ���̵�
	private String productName; //��ǰ �̸�
	private Integer unitPrice; //��ǰ ����
	private String description; //��ǰ ����
	private String condition; //�߰�ǰ ǥ��
	private String userId; // �Ǹ��� �̸�
	private int quantity; //��ٱ��Ͽ� ��� ��ǰ ����
	private String fileName; //�̹��� ���ϸ�
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
