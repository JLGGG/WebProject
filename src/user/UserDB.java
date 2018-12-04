package user;

import java.sql.*;
import java.util.ArrayList;

import user.User;

public class UserDB {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDB() {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/user_info?serverTimezone=UTC&useSSL=false";
			conn=DriverManager.getConnection(url,"root","1234");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 오류" + e.getMessage());
		}
	}
	
	public int write(String id, String pw, String address, String email, String mobile) {
		String SQL = "INSERT INTO user_table VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, id); 
			pstmt.setString(2, pw); 
			pstmt.setString(3, address); 
			pstmt.setString(4, email); 
			pstmt.setString(5, mobile); 
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int login(String id, String pw) {
		String SQL="SELECT pw FROM user_table WHERE id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1;	//로그인 성공
				}
				else
					return 0; //비밀번호 불일치
			}
			return -1;	//아이디가 없다
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2;	//데이터베이스 오류
	}
	
	public String searchId(String address, String email, String mobile) {
		String SQL="SELECT id FROM user_table WHERE address=? AND email=? AND mobile=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, address);
			pstmt.setString(2, email);
			pstmt.setString(3, mobile);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}else {
				return "";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "";
		
	}
	
	public String searchPw(String id, String address, String email, String mobile) {
		String SQL="SELECT pw FROM user_table WHERE id=? AND address=? AND email=? AND mobile=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, address);
			pstmt.setString(3, email);
			pstmt.setString(4, mobile);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString("pw");
			}else {
				return "";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "";
		
	}
/*
	// 아래부터 수정
	public ArrayList<User> getList() {
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

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
*/
}
