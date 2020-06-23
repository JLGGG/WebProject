package comment;

public class Comment {
	private int commentId;
	private int commentBoardId;
	private String userId;
	private String date;
	private String content;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getCommentBoardId() {
		return commentBoardId;
	}
	public void setCommentBoardId(int commentBoardId) {
		this.commentBoardId = commentBoardId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
