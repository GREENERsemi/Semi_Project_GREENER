package board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int boardCount;
	private int boardLike;
	private int boardId;
	private String boardName;
	private String boardStatus;
	private String boardWriter;
	private String nickName;
	
	
	public Board(int boardNo, String boardTitle, String boardContent, int boardId, String boardWriter) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardId = boardId;
		this.boardWriter = boardWriter;
	}

	public Board(int boardNo, String boardTitle, String boardContent, Date createDate, Date modifyDate, int boardCount,
			int boardLike, int boardId, String boardStatus, String boardWriter, String nickName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.boardCount = boardCount;
		this.boardLike = boardLike;
		this.boardId = boardId;
		this.boardStatus = boardStatus;
		this.boardWriter = boardWriter;
		this.nickName = nickName;
	}

	public Board() {}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Board(int boardNo, String boardTitle, String boardContent, Date createDate, Date modifyDate, int boardCount,
			int boardLike, int boardId, String boardStatus, String boardWriter) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.boardCount = boardCount;
		this.boardLike = boardLike;
		this.boardId = boardId;
		this.boardStatus = boardStatus;
		this.boardWriter = boardWriter;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", boardCount=" + boardCount
				+ ", boardLike=" + boardLike + ", boardId=" + boardId + ", boardName=" + boardName + ", boardStatus="
				+ boardStatus + ", boardWriter=" + boardWriter + "]";
	}

	
}
