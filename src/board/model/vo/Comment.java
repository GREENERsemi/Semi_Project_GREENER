package board.model.vo;

import java.sql.Date;

public class Comment {
	private int commentNo;
	private Date commentDate;
	private String commentContent;
	private String commentWriter;
	private int boardNo;
	private String commentStatus;
	private String nickName;
	
	public Comment() {}

	public Comment(int commentNo, Date commentDate, String commentContent, String commentWriter, int boardNo,
			String commentStatus, String nickName) {
		super();
		this.commentNo = commentNo;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.commentWriter = commentWriter;
		this.boardNo = boardNo;
		this.commentStatus = commentStatus;
		this.nickName = nickName;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentDate=" + commentDate + ", commentContent=" + commentContent
				+ ", commentWriter=" + commentWriter + ", boardNo=" + boardNo + ", commentStatus=" + commentStatus + ", nickName="
				+ nickName + "]";
	}
	
	
	
}
