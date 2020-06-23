package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;


public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			String dbURL = "jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe";
			String dbID = "bbang5368";
			String dbPW = "qlalfqjsgh";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(String productId, String productName, int unitPrice, String description, String condition, String userId,
			String imgName) {
		String SQL = "INSERT INTO product VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, productId); // 상품 번호
			pstmt.setString(2, productName); // 상품 이름
			pstmt.setInt(3, unitPrice); // 가격
			pstmt.setString(4, description); // 상세설명
			pstmt.setString(5, condition); // 중고 여부
			pstmt.setString(6, userId); // 판매자 등록
			pstmt.setInt(7, 0);
			pstmt.setString(8, imgName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Product> getList() {
		String SQL = "SELECT * FROM product";
		ArrayList<Product> list = new ArrayList<Product>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();

				product.setProductID(rs.getString(1));
				product.setProductName(rs.getString(2));
				product.setUnitPrice(rs.getInt(3));
				product.setDescription(rs.getString(4));
				product.setCondition(rs.getString(5));
				product.setUserId(rs.getString(6));
				product.setSellCondition(rs.getInt(7));
				product.setFileName(rs.getString(8));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
	
	public int deleteItem(String id, String productId) {
		String SQL = "DELETE FROM product WHERE userId=? AND productId=?";
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, productId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int radioCheckDbUpdate(String id, int radioNum) {
		String SQL = "UPDATE product SET sellCondition=? WHERE productId=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, radioNum);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	public ArrayList<Product> getSoldoutList() {
		String SQL = "SELECT * FROM product WHERE sellCondition=1";
		ArrayList<Product> list = new ArrayList<Product>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Product product = new Product();

				product.setUserId(rs.getString(6));
				product.setProductID(rs.getString(1));
				product.setProductName(rs.getString(2));
				product.setUnitPrice(rs.getInt(3));
				product.setDescription(rs.getString(4));
				
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
	
	public ArrayList<Product> getMyList(String userId) {
	      String SQL = "SELECT * FROM product WHERE userId=?";
	      ArrayList<Product> list = new ArrayList<Product>();

	      try {
		     PreparedStatement pstmt = conn.prepareStatement(SQL);	    	  
	         pstmt = conn.prepareStatement(SQL);

	         pstmt.setString(1, userId);
	         
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
					Product product = new Product();

					product.setProductID(rs.getString(1));
					product.setProductName(rs.getString(2));
					product.setUnitPrice(rs.getInt(3));
					product.setDescription(rs.getString(4));
					product.setCondition(rs.getString(5));
					product.setUserId(rs.getString(6));
					product.setSellCondition(rs.getInt(7));
					list.add(product);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
}
