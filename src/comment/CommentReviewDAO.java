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

			pstmt.setInt(1,getNext());//댓글번호
			pstmt.setInt(2, boardId);//글번호
			pstmt.setString(3, userId);//작성자
			pstmt.setString(4, getDate());//날짜
			pstmt.setString(5, content);//내용
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int delete_comment(int commentId) {
		String SQL = "DELETE FROM review_comment WHERE commentId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, commentId);
			return pstmt.executeUpdate(); // 성공적이면 0이상의 값 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
		
	}
}
