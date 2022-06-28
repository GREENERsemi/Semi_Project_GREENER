package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member loginUser(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginUser(conn, member);

		
		close(conn);
		return loginUser;
	}

	public Member selectMember(String loginUserId) {
		Connection conn = getConnection();
		
		Member selectMember = new MemberDAO().selectMember(conn, loginUserId);
		
		close(conn);
		return selectMember;
	}

	public String searchPwd(String userId, String userName) {
		Connection conn = getConnection();
		
		String searchPwd = new MemberDAO().searchPwd(conn, userId, userName);
		
		close(conn);
		
		return searchPwd;
	}

	public String searchId(String userName, String userEmail) {
		Connection conn = getConnection();
		
		String searchId = new MemberDAO().searchId(conn, userName, userEmail);
		
		close(conn);
		
		return searchId;
	}

	public int checkId(String inputId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkId(conn, inputId);
		
		close(conn);
		
		return result;
	}

	   public int insertMember(Member member) {
		      Connection conn = getConnection();
		      
		      int result = new MemberDAO().insertMember(conn, member);
		      
		      if(result > 0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      close(conn);
		      
		      return result;
		   }

		public int deleteMember(String userId) {
		      Connection conn = getConnection();
		      
		      int result = new MemberDAO().deleteMember(conn, userId);
		      
		      if(result > 0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      
		      return result;
		   }
		   
		public int updateMember(Member updateMember) {
			 Connection conn = getConnection();
			      
			 int result = new MemberDAO().updateMember(conn, updateMember);
			      
			      if(result >0) {
			         commit(conn);
			      } else {
			         rollback(conn);
			      }
			      
			 close(conn);
			      
		     return result;
		}
		
		   public int updatePwd(String userId, String userPwd, String newPwd) {
			      Connection conn = getConnection();
			      
			      int result = new MemberDAO().updatePwd(conn, userId, userPwd, newPwd);
			      
			      if(result >0) {
			         commit(conn);
			      } else {
			         rollback(conn);
			      }
			      
			      close(conn);
			      
			      return result;
			   }

		public int checkPhone(String phone) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().checkPhone(phone, conn);
			
			close(conn);
			
			return result;
		}

		public String searchIdByEmail(Member member) {
			Connection conn = getConnection();
			
			String searchIdByEmail = new MemberDAO().searchIdByEmail(conn, member);
			
			close(conn);
			
			return searchIdByEmail;
		}
		

		public String searchIdByPhone(Member member) {
			 Connection conn = getConnection();
			      
			 String searchIdByPhone = new MemberDAO().searchIdByPhone(conn, member);
			      
			 close(conn);
			      
			 return searchIdByPhone;
		}

		public int checkNickname(String userNickname) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().checkNickname(userNickname, conn);
			
			close(conn);
			
			return result;
		}

		public int emailDCheck(String userEmail) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().emailDCheck(conn, userEmail);
			
			close(conn);
			
			return result;
		}	
		
	   public int createNewPwd(Member member) {
		      Connection conn = getConnection();
		      
		      int result = new MemberDAO().createNewPwd(conn, member);
		      
		      if(result >0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      return result;
		}

	   public int updateNewPWd(String userId, String newPwd) {
	      Connection conn = getConnection();
	      
	      int result = new MemberDAO().updateNewPwd(conn, userId, newPwd);
	      
	      if(result>0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      return result;
	   }

	   public int emailValid(String userId, String email) {
	      Connection conn = getConnection();
	      
	      int result = new MemberDAO().emailValid(conn, userId, email);
	      
	      close(conn);
	      return result;
	   }     
}
