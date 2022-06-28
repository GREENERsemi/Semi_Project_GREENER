package board.model.vo;

import java.sql.Date;

public class Club extends Board{
	private String onlineYn;
	private String gatherPeriod;
	private Date acptStart;
	private Date acptEnd;

	public Club() {}

	public Club(String onlineYn, String gatherPeriod, Date acptStart, Date acptEnd) {
		super();
		this.onlineYn = onlineYn;
		this.gatherPeriod = gatherPeriod;
		this.acptStart = acptStart;
		this.acptEnd = acptEnd;
	}
	
	

	public Club(int boardNo, String boardTitle, String boardContent, Date createDate, Date modifyDate, int boardCount,
			int boardLike, int boardId, String boardStatus, String boardWriter, String nickName, String onlineYn,
			String gatherPeriod, Date acptStart, Date acptEnd) {
		super(boardNo, boardTitle, boardContent, createDate, modifyDate, boardCount, boardLike, boardId, boardStatus,
				boardWriter, nickName);
		this.onlineYn = onlineYn;
		this.gatherPeriod = gatherPeriod;
		this.acptStart = acptStart;
		this.acptEnd = acptEnd;
	}

	public String getOnlineYn() {
		return onlineYn;
	}

	public void setOnlineYn(String onlineYn) {
		this.onlineYn = onlineYn;
	}

	public String getGatherPeriod() {
		return gatherPeriod;
	}

	public void setGatherPeriod(String gatherPeriod) {
		this.gatherPeriod = gatherPeriod;
	}

	public Date getAcptStart() {
		return acptStart;
	}

	public void setAcptStart(Date acptStart) {
		this.acptStart = acptStart;
	}

	public Date getAcptEnd() {
		return acptEnd;
	}

	public void setAcptEnd(Date acptEnd) {
		this.acptEnd = acptEnd;
	}

	@Override
	public String toString() {
		return "Club [onlineYn=" + onlineYn + ", gatherPeriod=" + gatherPeriod + ", acptStart=" + acptStart
				+ ", acptEnd=" + acptEnd + ", getBoardNo()=" + getBoardNo() + ", getBoardTitle()=" + getBoardTitle()
				+ ", getBoardContent()=" + getBoardContent() + ", getCreateDate()=" + getCreateDate()
				+ ", getModifyDate()=" + getModifyDate() + ", getBoardCount()=" + getBoardCount() + ", getBoardLike()="
				+ getBoardLike() + ", getBoardId()=" + getBoardId() + ", getBoardStatus()=" + getBoardStatus()
				+ ", getBoardWriter()=" + getBoardWriter() + ", getNickName()=" + getNickName() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}



}
