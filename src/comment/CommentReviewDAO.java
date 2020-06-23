package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class CommentReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentReviewDAO() {
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
	      String SQL = "SELECT commentId FROM review_comment ORDER BY commentId DESC";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            return rs.getInt(1) + 1;
	         }
	         return 1; // ù��° �Խù��� ���
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return -1; // �����ͺ��̽� ����!
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

	      return ""; // �����ͺ��̽� ����!
	   }
	public Comment getComment(int commentId) {
		String SQL = "SELECT * FROM review_comment WHERE commentId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Comment comment = new Comment();

				comment.setCommentId(rs.getInt(1));
				comment.setCommentBoardId(rs.getInt(2));
				comment.setUserId(rs.getString(3));
				comment.setDate(rs.getString(4));
				comment.setContent(rs.getString(5));

				return comment;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<Comment> getCommentList(int boardNum){
		String SQL = "SELECT * FROM review_comment WHERE boardId =?";
		ArrayList<Comment> comment_list = new ArrayList<Comment>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setCommentId(rs.getInt(1));
				comment.setCommentBoardId(rs.getInt(2));
				comment.setUserId(rs.getString(3));
				comment.setDate(rs.getString(4));
				comment.setContent(rs.getString(5));
				comment_list.add(comment);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return comment_list;
	}
	
	public int add_comment(int boardId, String userId, String content) {
		String SQL = "INSERT INTO review_comment VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1,getNext());//��۹�ȣ
			pstmt.setInt(2, boardId);//�۹�ȣ
			pstmt.setString(3, userId);//�ۼ���
			pstmt.setString(4, getDate());//��¥
			pstmt.setString(5, content);//����
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	public int delete_comment(int commentId) {
		String SQL = "DELETE FROM review_comment WHERE commentId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, commentId);
			return pstmt.executeUpdate(); // �������̸� 0�̻��� �� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
		
	}
}
