package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MomBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MomBoardDAO() {

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

	// 날짜 반환 함수
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

	// 글번호 postId 내림차순 반환 함수
	public int getNext() {
		String SQL = "SELECT postId FROM momboard ORDER BY postId DESC";
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
	
	// 조회수 views 반환 함수
	public boolean updateViews(int postId) {
		boolean result = false;

		String SQL = "UPDATE momboard SET views=views+1 WHERE postId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postId);

			int flag = pstmt.executeUpdate();
			if (flag > 0) { // 정상적으로 수행되었을때
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 글쓰기 구현 함수
	public int write(String title, String content, String userId) {
		String SQL = "INSERT INTO momboard VALUES (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, title); // 제목
			pstmt.setString(2, content); // 내용
			pstmt.setInt(3, getNext()); // 글번호
			pstmt.setString(4, getDate()); // 날짜
			pstmt.setInt(5, 1); // 삭제?
			pstmt.setString(6, userId); // 작성자
			pstmt.setInt(7, 0);// 조회수
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Board> getListBYtitle() {
		String SQL = "SELECT * FROM momboard WHERE Available=1 ORDER BY binary(title)";
		ArrayList<Board> list = new ArrayList<Board>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();

				board.setTitle(rs.getString(1));
				board.setContent(rs.getString(2));
				board.setPostId(rs.getInt(3));
				board.setDate(rs.getString(4));
				board.setAvailable(rs.getInt(5));
				board.setUserId(rs.getString(6));
				board.setViews(rs.getInt(7));

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Board> getListBYrecent() {
		String SQL = "SELECT * FROM momboard WHERE Available=1 ORDER BY date DESC";
		ArrayList<Board> list = new ArrayList<Board>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();

				board.setTitle(rs.getString(1));
				board.setContent(rs.getString(2));
				board.setPostId(rs.getInt(3));
				board.setDate(rs.getString(4));
				board.setAvailable(rs.getInt(5));
				board.setUserId(rs.getString(6));
				board.setViews(rs.getInt(7));

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Board> getListBYviews() {
		String SQL = "SELECT * FROM momboard WHERE Available=1 ORDER BY views DESC";
		ArrayList<Board> list = new ArrayList<Board>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();

				board.setTitle(rs.getString(1));
				board.setContent(rs.getString(2));
				board.setPostId(rs.getInt(3));
				board.setDate(rs.getString(4));
				board.setAvailable(rs.getInt(5));
				board.setUserId(rs.getString(6));
				board.setViews(rs.getInt(7));

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 글 5개씩 Available이 1인 게시물만 한 page에 넣기
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM momboard WHERE postId <? AND Available=1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber) * 5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 글내용 보이기 getBoard(), 반환형은 Board
	public Board getBoard(int postId) {
		String SQL = "SELECT * FROM momboard WHERE postId=? AND Available =1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();

				board.setTitle(rs.getString(1));
				board.setContent(rs.getString(2));
				board.setPostId(rs.getInt(3));
				board.setDate(rs.getString(4));
				board.setAvailable(rs.getInt(5));
				board.setUserId(rs.getString(6));
				board.setViews(rs.getInt(7));

				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 수정하기 update()
	public int update(int postId, String title, String content) {
		String SQL = "UPDATE momboard SET title=?, content=? WHERE postId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, postId);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int delete(int postId) {
		String SQL = "UPDATE momboard SET Available=0 WHERE postId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, postId);
			return pstmt.executeUpdate(); // 성공적이면 0이상의 값 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 검색기능
	public ArrayList<Board> search(String title) {
		String SQL = "SELECT * FROM momboard WHERE title LIKE ?";
		ArrayList<Board> searchlist = new ArrayList<Board>();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + title + "%");// 와일드카드
			rs = pstmt.executeQuery();// 결과실행
			while (rs.next()) {
				Board board = new Board();

				board.setTitle(rs.getString(1));
				board.setContent(rs.getString(2));
				board.setPostId(rs.getInt(3));
				board.setDate(rs.getString(4));
				board.setAvailable(rs.getInt(5));
				board.setUserId(rs.getString(6));
				board.setViews(rs.getInt(7));

				searchlist.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return searchlist;
	}

	public ArrayList<Board> getMyList(String userId) {
	      String SQL = "SELECT * FROM momboard WHERE userId=? AND Available=1";
	      ArrayList<Board> list = new ArrayList<Board>();

	      try {
		     PreparedStatement pstmt = conn.prepareStatement(SQL);	    	  
	         pstmt = conn.prepareStatement(SQL);

	         pstmt.setString(1, userId);
	         
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            Board board = new Board();

	            board.setTitle(rs.getString(1));
	            board.setContent(rs.getString(2));
	            board.setPostId(rs.getInt(3));
	            board.setDate(rs.getString(4));
	            board.setAvailable(rs.getInt(5));
	            board.setUserId(rs.getString(6));
	            board.setViews(rs.getInt(7));
	            
	            list.add(board);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
 
	
}