package letter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;
import comment.Comment;

public class LetterDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LetterDAO() {
		try {
			String dbURL = "jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe";
			String dbID = "bbang5368";
			String dbPW = "qlalfqjsgh";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			//conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getNext() {
	      String SQL = "SELECT letterId FROM letters ORDER BY letterId DESC";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            return rs.getInt(1) + 1;
	         }
	         return 1; // 첫번째 게시물인 경우
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return -1; // 데이터베이스 오류!
	   }
	public String getDate() {
	      String SQL = "SELECT NOW()";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            return rs.getString(1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return ""; // 데이터베이스 오류!
	   }
	public ArrayList<Letter> getRecieveLetterList(String userId){
		String SQL = "SELECT * FROM letters WHERE recvId =? AND recvDel = 0";
		ArrayList<Letter> recieveLetter_list = new ArrayList<Letter>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Letter letter = new Letter();
				letter.setLetterId(rs.getInt(1));
				letter.setRecvId(rs.getString(2));
				letter.setSenderId(rs.getString(3));
				letter.setContent(rs.getString(4));
				letter.setDateSent(rs.getString(5));
				letter.setDateRead(rs.getString(6));
				letter.setCheckRead(rs.getInt(7));
				letter.setRecvDel(rs.getInt(8));
				letter.setSenderDel(rs.getInt(9));
				
				recieveLetter_list.add(letter);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return recieveLetter_list;
	}
	public ArrayList<Letter> getSendLetterList(String userId){
		String SQL = "SELECT * FROM letters WHERE senderId =? AND senderDel = 0";
		ArrayList<Letter> sendLetter_list = new ArrayList<Letter>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Letter letter = new Letter();
				letter.setLetterId(rs.getInt(1));
				letter.setRecvId(rs.getString(2));
				letter.setSenderId(rs.getString(3));
				letter.setContent(rs.getString(4));
				letter.setDateSent(rs.getString(5));
				letter.setDateRead(rs.getString(6));
				letter.setCheckRead(rs.getInt(7));
				letter.setRecvDel(rs.getInt(8));
				letter.setSenderDel(rs.getInt(9));
				
				sendLetter_list.add(letter);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return sendLetter_list;
	}
	
	public int add_letter(String recvId, String senderId, String content) {
		String SQL = "INSERT INTO letters VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1,getNext());//쪽지 번호
			pstmt.setString(2, recvId);//받는사람
			pstmt.setString(3, senderId);//보낸사람
			pstmt.setString(4, content);//내용
			pstmt.setString(5, getDate());//보낸날짜
			pstmt.setString(6, "");//읽은날짜
			pstmt.setInt(7, 0);//읽음여부
			pstmt.setInt(8, 0);//받는사람이 지웠는지 여부
			pstmt.setInt(9, 0);//보낸사람이 지웠는지 여부
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int senderDelete(int letterId) {//보낸메일함에서 삭제
		String SQL = "UPDATE letters SET senderDel=1 WHERE letterId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, letterId);
			return pstmt.executeUpdate(); // 성공적이면 0이상의 값 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int recieverDelete(int letterId) {//보낸메일함에서 삭제
		String SQL = "UPDATE letters SET recvDel=1 WHERE letterId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, letterId);
			return pstmt.executeUpdate(); // 성공적이면 0이상의 값 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public boolean updateRead(int letterId) {
        boolean result = false;
        
        String SQL = "UPDATE letters SET checkRead=1 WHERE letterId=?";
        try {
           PreparedStatement pstmt = conn.prepareStatement(SQL);
           pstmt.setInt(1, letterId);
           
           int flag=pstmt.executeUpdate();      
           if(flag>0) {            //정상적으로 수행되었을때
              return true;
           }
        } catch (Exception e) {
           e.printStackTrace();
        }
        return false;
     }
	
	public Letter getLetter(int letterId) {
	      String SQL = "SELECT * FROM letters WHERE letterId=?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, letterId);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            Letter letter = new Letter();

	            letter.setLetterId(rs.getInt(1));
	            letter.setRecvId(rs.getString(2));
	            letter.setSenderId(rs.getString(3));
	            letter.setContent(rs.getString(4));
	            letter.setDateSent(rs.getString(5));
	            letter.setDateRead(rs.getString(6));
	            letter.setCheckRead(rs.getInt(7));
	            letter.setRecvDel(rs.getInt(8));
	            letter.setSenderDel(rs.getInt(8));
	            
	            return letter;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
}
