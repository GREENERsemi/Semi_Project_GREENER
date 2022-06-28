package member.model.dao;



import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;

import member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();  
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public Member loginUser(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		
		String query = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());

			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				loginUser = new Member(rset.getString("USER_ID"), 
						               rset.getString("USER_PWD"), 
						               rset.getString("USER_NAME"), 
						               rset.getString("NICKNAME"),
									   rset.getString("EMAIL"),
									   rset.getString("PHONE"),
									   rset.getString("BIRTH_DATE"),
									   rset.getString("MEMBER_STATUS"),
									   rset.getString("MANAGER_YN"),
									   rset.getString("PWD_CONFIRM"),
									   rset.getDate("CREATE_DATE"),
									   rset.getDate("MODIFY_DATE"),
									   // 추가
									   rset.getInt("PWD_QUESTION"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
//		System.out.println(loginUser);
		
		return loginUser;
	}

	public Member selectMember(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member selectMember = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				selectMember = new Member(rset.getString("USER_ID"),
								 	rset.getString("USER_PWD"),
									rset.getString("USER_NAME"),
									rset.getString("NICKNAME"),
									rset.getString("EMAIL"),
									rset.getString("PHONE"),
									rset.getString("BIRTH_DATE"),
									rset.getString("MEMBER_STATUS"),
									rset.getString("MANAGER_YN"),
									rset.getString("PWD_CONFIRM"),
									rset.getDate("CREATE_DATE"),
									rset.getDate("MODIFY_DATE"),	
									// 추가
									rset.getInt("PWD_QUESTION"));
									
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectMember;
	}

	public String searchPwd(Connection conn, String userId, String userName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String searchPwd = null;
		
		String query = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				searchPwd = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchPwd;
	}

	public String searchId(Connection conn, String userName, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String searchId = null;
		
		String query = prop.getProperty("searchId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				searchId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchId;
	}

	public int checkId(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	   public int insertMember(Connection conn, Member member) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("insertMember");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, member.getUserId());
		         pstmt.setString(2, member.getUserPwd());
		         pstmt.setString(3, member.getUserName());
		         pstmt.setString(4, member.getNickName());
		         pstmt.setString(5, member.getEmail());
		         pstmt.setString(6, member.getPhone());
		         pstmt.setString(7, member.getBirthDate());
		         pstmt.setString(8, member.getPwdConfirm());
		         pstmt.setInt(9, member.getPwdQuestion());
		         
		         result = pstmt.executeUpdate();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      return result;
		   }

		   public int deleteMember(Connection conn, String userId) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("deleteMember");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, userId);
		         result = pstmt.executeUpdate();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      return result;
		   }
	
		   public int updateMember(Connection conn, Member updateMember) {
			      PreparedStatement pstmt = null;
			      int result = 0;
			      
			      
			      String query = prop.getProperty("updateMember");
			      try {
			         pstmt = conn.prepareStatement(query);
			         pstmt.setString(1, updateMember.getUserName());
			         pstmt.setString(2, updateMember.getNickName());
			         pstmt.setString(3, updateMember.getEmail());
			         pstmt.setString(4, updateMember.getPhone());
			         pstmt.setString(5, updateMember.getUserId());
			         
			         result = pstmt.executeUpdate();
			      } catch (SQLException e) {
			         e.printStackTrace();
			      } finally {
			         close(pstmt);
			      }

			      return result;
			   }
		   
		   public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
			      PreparedStatement pstmt = null;
			      int result = 0;
			      
			      String query = prop.getProperty("updatePwd");
			      
			      try {
			         pstmt = conn.prepareStatement(query);
			         pstmt.setString(1, newPwd);
			         pstmt.setString(2, userId);
			         pstmt.setString(3, userPwd);
			         
			         result = pstmt.executeUpdate();
			      } catch (SQLException e) {
			         e.printStackTrace();
			      } finally {
			         close(pstmt);
			      }

			      return result;
			   }

		public int checkPhone(String phone, Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
			
			String query = prop.getProperty("checkPhone");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, phone);
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					result = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
		}

		   public String searchIdByEmail(Connection conn, Member member) {
			      PreparedStatement pstmt = null;
			      ResultSet rset = null;
			      String searchIdByEmail = null;
			      
			      String query = prop.getProperty("searchIdByEmail");
			      
			      try {
			         pstmt = conn.prepareStatement(query);
			         pstmt.setString(1, member.getUserName());
			         pstmt.setString(2, member.getEmail());
			         
			         rset = pstmt.executeQuery();
			         
			         if(rset.next()) {
			            searchIdByEmail = rset.getString("USER_ID");
			         }
			         
			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
			      
			      return searchIdByEmail;
			   }

			   public String searchIdByPhone(Connection conn, Member member) {
			      PreparedStatement pstmt = null;
			      ResultSet rset = null;
			      String searchIdByPhone = null;
			      
			      String query = prop.getProperty("searchIdByPhone");
			      
			      try {
			         pstmt = conn.prepareStatement(query);
			         pstmt.setString(1, member.getUserName());
			         pstmt.setString(2, member.getPhone());
			         
			         rset = pstmt.executeQuery();
			         if(rset.next()) {
			            searchIdByPhone = rset.getString("USER_ID");
			         }
			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
			      
			      return searchIdByPhone;
			   }

			public int checkNickname(String userNickname, Connection conn) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				
				String query = prop.getProperty("checkNickname");
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userNickname);
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						result = rset.getInt(1);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return result;
			}

			public int emailDCheck(Connection conn, String userEmail) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				
				String query = prop.getProperty("emailDCheck");
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userEmail);
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						result = rset.getInt(1);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return result;
			}
			
			public int createNewPwd(Connection conn, Member member) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				
				String query = prop.getProperty("createNewPwd");
				
				try {
					pstmt = conn.prepareStatement(query);
					
					pstmt.setString(1, member.getUserId());
					pstmt.setString(2, member.getPwdConfirm());
					pstmt.setInt(3, member.getPwdQuestion());
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						result = rset.getInt(1);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				
				return result;
			}
			
			public int updateNewPwd(Connection conn, String userId, String newPwd) {
				PreparedStatement pstmt = null;
				int result = 0;
				
				String query = prop.getProperty("updateNewPwd");
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, newPwd);
					pstmt.setString(2, userId);
					
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				
				return result;
			}
			
			public int emailValid(Connection conn, String userId, String email) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				
				String query = prop.getProperty("emailValid");
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userId);
					pstmt.setString(2, email);
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						result = rset.getInt(1);					
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}

				return result;
			}
}