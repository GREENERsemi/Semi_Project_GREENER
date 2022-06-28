package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageInfo;

public class NoticeService {

	public ArrayList<Notice> selectList(NoticePageInfo npi) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().selectList(conn, npi);
		
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn, n);
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Notice selectNotice(int no) {
		Connection conn = getConnection();
		
		// 조회수 업데이트
		int result = new NoticeDAO().updateCount(conn, no);
		
		Notice notice = null;
		if(result>0) {
			//공지사항 상세보기
			notice = new NoticeDAO().selectNotice(conn, no);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return notice;
	}

	public int updateNotice(Notice updateNotice) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().updateNotice(conn, updateNotice);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().deleteNotice(conn, noticeNo);
		
		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDAO().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Notice> selectFixedList() {
		Connection conn = getConnection();
		
		ArrayList<Notice> fixedList = new NoticeDAO().selectFixedList(conn);
		
		close(conn);
		return fixedList;
	}

}
