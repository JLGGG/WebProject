package user;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		
		try {
			String dbURL ="jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe";
			String dbID="bbang5368";
			String dbPW="qlalfqjsgh";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPW);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pw) //�α��� �õ��ϴ� �Լ�
	{
		String SQL="SELECT pw FROM member_info WHERE id= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1;	//�α��� ����
				}
				else
					return 0; //��й�ȣ ����ġ
			}
			return -1;	//���̵� ����
		}	catch(Exception e){
			e.printStackTrace();
		}
		return -2;	//�����ͺ��̽� ����		
	}
	
	public int join(User user) {
		String SQL="INSERT INTO member_info VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user.getId());
			pstmt.setString(2,user.getPw());
			pstmt.setString(3,user.getName());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getYear());
			pstmt.setString(6,user.getMonth());
			pstmt.setString(7,user.getDate());
			pstmt.setString(8,user.getJoinPath());
			pstmt.setString(9,user.getRecommend());
			pstmt.setString(10,"�Ϲ�"); //���
			pstmt.setInt(11,0); //�Ŵ���
			return pstmt.executeUpdate();
		}		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//�����ͺ��̽� ����
	}
	
	public int checkID(String newid) {
		String SQL = "select id from member_info WHERE id=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, newid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (newid.equals(rs.getString("id"))) {
					return 0;	//�ߺ��� ���̵� �߰�
				}
			}
			return 1; 	// �ߺ��� ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����!
	}
	public String findID(String name, String year, String month, String date) {
		String SQL = "select id from member_info where name=? and year=? and month=? and date=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, name);
			pstmt.setString(2, year);
			pstmt.setString(3, month);
			pstmt.setString(4, date);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
					return rs.getString("id");	//�Է��� ������ ������ ���̵� �߰�
				}
			else return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";	//�����ͺ��̽� ����
	}
	public String findPW(String name, String id, String year, String month, String date) {
		String SQL = "select pw from member_info where name=? and id=? and year=? and month=? and date=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, year);
			pstmt.setString(4, month);
			pstmt.setString(5, date);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
					return rs.getString("pw");	//�Է��� ������ ������ ���̵� �߰�
				}
			else return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";	//�����ͺ��̽� ����
	}
	
	public int resetPW(String pw,String userId) {
		String SQL = "UPDATE member_info SET pw=? WHERE userId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, pw);
			pstmt.setString(2, userId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	//�۳��� ���̱� getBoard(), ��ȯ���� Board
		public User getUser(String userId) {
			String SQL = "SELECT * FROM member_info WHERE id=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					User user = new User();
					
					user.setId(rs.getString(1));
					user.setPw(rs.getString(2));
					user.setName(rs.getString(3));
					user.setGender(rs.getString(4));
					user.setYear(rs.getString(5));
					user.setMonth(rs.getString(6));
					user.setDate(rs.getString(7));
					user.setJoinPath(rs.getString(8));
					user.setRecommend(rs.getString(9));
					user.setLevel(rs.getString(10));
					user.setManager(rs.getInt(11));
														
					return user;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		//�����ϱ� update()
	      public int update(String pw, String name, String id) {
	         String SQL = "UPDATE member_info SET pw=? WHERE id=?";
	         try {
	            pstmt = conn.prepareStatement(SQL);

	            pstmt.setString(1,pw);
	            pstmt.setString(2,id);
	            
	            return pstmt.executeUpdate();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return -1; // �����ͺ��̽� ����
	      }
	      
	      public int level_update(String id, String level) {
		         String SQL = "UPDATE member_info SET level=? WHERE id=?";
		         try {
		            pstmt = conn.prepareStatement(SQL);

		            pstmt.setString(1,level);
		            pstmt.setString(2,id);
		            
		            return pstmt.executeUpdate();
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         return -1; // �����ͺ��̽� ����
		      }

	      //Ż���ϱ� terminate()
	      public int terminate(String id) {
	         String SQL = "DELETE FROM member_info WHERE id = ?";
	         try {
	            pstmt = conn.prepareStatement(SQL);

	            pstmt.setString(1, id);
	            return pstmt.executeUpdate();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return -1; // �����ͺ��̽� ����
	      }
	      
	      public ArrayList<User> getUserList() {
		      String SQL = "SELECT * FROM member_info ORDER BY id DESC";
		      ArrayList<User> list = new ArrayList<User>();

		      try {
			     PreparedStatement pstmt = conn.prepareStatement(SQL);	    	  
		         pstmt = conn.prepareStatement(SQL);
		         
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		            User user = new User();

		            user.setId(rs.getString(1));
		            user.setPw(rs.getString(2));
		            user.setName(rs.getString(3));
		            user.setGender(rs.getString(4));
		            user.setYear(rs.getString(5));
					user.setMonth(rs.getString(6));
					user.setDate(rs.getString(7));
					user.setLevel(rs.getString(10));
		            
		            list.add(user);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return list;
		   }
	   
}
