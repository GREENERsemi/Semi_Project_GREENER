package notice.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import notice.model.vo.Notice;
import notice.model.vo.NoticePageInfo;

public class NoticeDAO {
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	public ArrayList<Notice> selectList(Connection conn, NoticePageInfo npi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("selectList");
		
		int startRow =(npi.getCurrentPage()-1)*npi.getBoardLimit()+1;
		int endRow = startRow + npi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("NOTICE_WRITER"),
						rset.getString("NICKNAME"),
						rset.getInt("NOTICE_COUNT"),
						rset.getDate("NOTICE_DATE"),
						rset.getString("NOTICE_STATUS"),
						rset.getString("FIX")
						));	
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeWriter());
			pstmt.setString(4, n.getFix());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				notice = new Notice(
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("NOTICE_WRITER"),
						rset.getString("NICKNAME"),
						rset.getInt("NOTICE_COUNT"),
						rset.getDate("NOTICE_DATE"),
						rset.getString("NOTICE_STATUS"),
						rset.getString("FIX")
						);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return notice;
	}

	public int updateNotice(Connection conn, Notice updateNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, updateNotice.getNoticeTitle());
			pstmt.setString(2, updateNotice.getNoticeContent());
			pstmt.setDate(3, updateNotice.getNoticeDate());
			pstmt.setString(4, updateNotice.getFix());
			pstmt.setInt(5, updateNotice.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		
		return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listCount;
	}

	public ArrayList<Notice> selectFixedList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> fixedList = new ArrayList<Notice>();
		
		String query = prop.getProperty("selectFixedList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				fixedList.add(new Notice(
						rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("NOTICE_WRITER"),
						rset.getString("NICKNAME"),
						rset.getInt("NOTICE_COUNT"),
						rset.getDate("NOTICE_DATE"),
						rset.getString("NOTICE_STATUS"),
						rset.getString("FIX")												
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}


		return fixedList;
	}

	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
