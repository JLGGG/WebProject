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

	// ��¥ ��ȯ �Լ�
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

	// �۹�ȣ postId �������� ��ȯ �Լ�
	public int getNext() {
		String SQL = "SELECT postId FROM momboard ORDER BY postId DESC";
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
	
	// ��ȸ�� views ��ȯ �Լ�
	public boolean updateViews(int postId) {
		boolean result = false;

		String SQL = "UPDATE momboard SET views=views+1 WHERE postId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postId);

			int flag = pstmt.executeUpdate();
			if (flag > 0) { // ���������� ����Ǿ�����
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// �۾��� ���� �Լ�
	public int write(String title, String content, String userId) {
		String SQL = "INSERT INTO momboard VALUES (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, title); // ����
			pstmt.setString(2, content); // ����
			pstmt.setInt(3, getNext()); // �۹�ȣ
			pstmt.setString(4, getDate()); // ��¥
			pstmt.setInt(5, 1); // ����?
			pstmt.setString(6, userId); // �ۼ���
			pstmt.setInt(7, 0);// ��ȸ��
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
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

	// �� 5���� Available�� 1�� �Խù��� �� page�� �ֱ�
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

	// �۳��� ���̱� getBoard(), ��ȯ���� Board
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

	// �����ϱ� update()
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
		return -1; // �����ͺ��̽� ����
	}

	public int delete(int postId) {
		String SQL = "UPDATE momboard SET Available=0 WHERE postId=?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, postId);
			return pstmt.executeUpdate(); // �������̸� 0�̻��� �� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	// �˻����
	public ArrayList<Board> search(String title) {
		String SQL = "SELECT * FROM momboard WHERE title LIKE ?";
		ArrayList<Board> searchlist = new ArrayList<Board>();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + title + "%");// ���ϵ�ī��
			rs = pstmt.executeQuery();// �������
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