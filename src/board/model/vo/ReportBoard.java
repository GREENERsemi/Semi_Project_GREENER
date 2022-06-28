package board.model.vo;

import java.sql.Date;

public class ReportBoard{
	private int reportNo;			//신고 글 번호
	private int reportType;
	private String reportContent;
	private Date reportDate;
	private String reportUser;		//신고를 '한' 회원 ID(당한x)
	private int reportBNo;			//신고 당한 글의 board_no
	
	public ReportBoard() {}

	public ReportBoard(int reportNo, int reportType, String reportContent, Date reportDate,
			String reportUser, int reportBNo) {
		super();
		this.reportNo = reportNo;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportUser = reportUser;
		this.reportBNo = reportBNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportUser() {
		return reportUser;
	}

	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}

	public int getReportBNo() {
		return reportBNo;
	}

	public void setReportBNo(int reportBNo) {
		this.reportBNo = reportBNo;
	}

	@Override
	public String toString() {
		return "ReportBoard [reportNo=" + reportNo + ", reportType=" + reportType + ", reportContent=" 
				+ reportContent + ", reportDate=" + reportDate + ", reportUser=" + reportUser + ", reportBNo=" + reportBNo + "]";
	}
	
}
