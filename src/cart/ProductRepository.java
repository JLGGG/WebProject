package cart;

import java.io.Serializable;
import java.util.ArrayList;
import cart.Product;

public class ProductRepository implements java.io.Serializable{
	
	private ArrayList<Product> productList = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public ProductRepository() {
		super();
		Product phone=new Product("P0000", "galaxy", 100000);
		phone.setCondition("old");
		phone.setDescription("테스트입니다");
		
		productList.add(phone);
	}
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public void addProduct(Product product) {
		productList.add(product);
	}
	
	
	
	public ArrayList<Product> getAllProducts(){
		return productList;
	}
	
	public Product getProductById(String productId) {
		Product id=null;
		
		for(int i=0; i<productList.size(); i++) {
			Product product = productList.get(i);
			if(product != null && product.getProductID()!=null && product.getProductID().equals(productId)) {
				id=product;
				break;
			}
		}
		
		return id;
	}
}
