package board.model.dao;

import static common.JDBCTemplate.close;

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

import board.model.vo.Board;
import board.model.vo.ChallengeBoard;
import board.model.vo.Club;
import board.model.vo.Comment;
import board.model.vo.Image;
import board.model.vo.News;
import board.model.vo.Page;
import board.model.vo.Recipe;
import board.model.vo.ReportBoard;

public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	   public ArrayList<Recipe> selectRList(Connection conn) {
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   ArrayList<Recipe> list =  new ArrayList<>();
		   
		   String query = prop.getProperty("selectRList");
		   
		   try {
		      pstmt = conn.prepareStatement(query);

		      rset = pstmt.executeQuery();
		   
//		      list = new ArrayList<Recipe>();

		      while(rset.next()) {
		            Recipe r = new Recipe(rset.getInt("BOARD_NO"),
		                    rset.getString("BOARD_TITLE"),
		                    rset.getString("BOARD_CONTENT"),
		                    rset.getDate("CREATE_DATE"),
		                    rset.getDate("MODIFY_DATE"),
		                    rset.getInt("BOARD_COUNT"),
		                    rset.getInt("BOARD_LIKE"),
		                    rset.getInt("BOARD_ID"),
		                    rset.getString("BOARD_STATUS"),
		                    rset.getString("BOARD_WRITER"),
		                    rset.getString("NICKNAME"),
		                    rset.getString("MENU_NAME"),
		                    rset.getString("INGREDIENT"));
		     list.add(r);
		  }

		   
		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		      close(rset);
		      close(pstmt);
		   }
		   return list;
		}

	
	public int getClubListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getClubListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount = rset.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		
		return listCount;
	}
	
	  public int newsupdateCount(Connection conn, int bId) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("newsupdateCount");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, bId);
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }

	
	  public ArrayList<News> selectList(Connection conn, Page pi) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<News> list = new ArrayList<>();
	      
	      
	      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	      int endRow = startRow + pi.getBoardLimit() - 1;
	      
	      String query = prop.getProperty("selectList");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            list.add(new News(rset.getInt("BOARD_NO"),
                        rset.getString("BOARD_TITLE"),
                        rset.getString("BOARD_CONTENT"),
                        rset.getDate("CREATE_DATE"),
                        rset.getDate("MODIFY_DATE"),
                        rset.getInt("BOARD_COUNT"),
                        rset.getInt("BOARD_LIKE"),
                        rset.getInt("BOARD_ID"),
                        rset.getString("BOARD_STATUS"),
                        rset.getString("BOARD_WRITER"),
                        rset.getString("NICKNAME"),
                        rset.getString("NEWS_REFERENCE"),
                        rset.getString("NEWS_CATEGORY")

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

	  public News selectBoard(Connection conn, int bId) {
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         News n = null;
	         
	         String query = prop.getProperty("newsSelectBoard");
	         
	         try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, bId);
	            rset = pstmt.executeQuery();
	            
	            if(rset.next()) {
	               n = new News(rset.getInt("BOARD_NO"),
	                        rset.getString("BOARD_TITLE"),
	                        rset.getString("BOARD_CONTENT"),
	                        rset.getDate("CREATE_DATE"),
	                        rset.getDate("MODIFY_DATE"),
	                        rset.getInt("BOARD_COUNT"),
	                        rset.getInt("BOARD_LIKE"),
	                        rset.getInt("BOARD_ID"),
	                        rset.getString("BOARD_STATUS"),
	                        rset.getString("BOARD_WRITER"),
	                        rset.getString("NICKNAME"),
	                        rset.getString("NEWS_REFERENCE"),
	                        rset.getString("NEWS_CATEGORY"));
	               
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         return n;
	      }

	
	public ArrayList<Club> selectClubList(Connection conn, Page pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Club> selectList = new ArrayList<Club>();
		String nickname = null;
		
		String query = prop.getProperty("selectClubList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				selectList.add(new Club(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_LIKE"),
						rset.getInt("BOARD_ID"),
						rset.getString("BOARD_STATUS"),
						rset.getString("BOARD_WRITER"),
						rset.getString("NICKNAME"),
						rset.getString("ONLINE_YN"),
						rset.getString("GATHER_PERIOD"),
						rset.getDate("ACCEPTANCE_START"),
						rset.getDate("ACCEPTANCE_END")
						));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return selectList;
	}
	
	public int insertClub(Connection conn, Club club) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertClub");
		
		try {
			// board에 데이터 삽입
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, club.getBoardTitle());
			pstmt.setString(2, club.getBoardContent());
			pstmt.setInt(3, 2);
			pstmt.setString(4, club.getBoardWriter());	
			pstmt.setString(5, club.getOnlineYn());
			pstmt.setString(6, club.getGatherPeriod());
			pstmt.setDate(7, club.getAcptStart());
			pstmt.setDate(8, club.getAcptEnd());
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	   public ArrayList<Comment> selectCommentList(Connection conn, int bNo) {
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      ArrayList<Comment> comList = null;
		      
		      String query = prop.getProperty("selectCommentList");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setInt(1, bNo);
		         rset = pstmt.executeQuery();
		         comList = new ArrayList<Comment>();
		         while(rset.next()) {
		            comList.add(new Comment(rset.getInt("COMMENT_NO"),
		                              rset.getDate("COMMENT_DATE"),
		                              rset.getString("COMMENT_CONTENT"),
		                              rset.getString("COMMENT_WRITER"),
		                              rset.getInt("BOARD_NO"),
		                              rset.getString("COMMENT_STATUS"),
		                              rset.getString("NICKNAME")));
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      return comList;
		   }

		   public int insertComment(Connection conn, Comment com) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("insertComment");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, com.getCommentContent());
		         pstmt.setString(2, com.getCommentWriter());
		         pstmt.setInt(3, com.getBoardNo());

		         result = pstmt.executeUpdate();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      return result;
		   }

	
	public int getListCount5(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount5");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}
	
	public int getListCount3(Connection conn) {
	      Statement stmt = null;
	      ResultSet rset = null;
	      int result = 0;
	      
	      String query = prop.getProperty("getListCount3");
	      
	      try {
	         stmt = conn.createStatement();
	         rset = stmt.executeQuery(query);
	         
	         if(rset.next()) {
	            result = rset.getInt(1);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(stmt);
	      }
	      return result;
	   }

	
	public Club selectClub(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Club club = null;
		
		String query = prop.getProperty("selectClub");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
				
			rset = pstmt.executeQuery();
			if(rset.next()) {
				club = new Club(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_LIKE"),
						rset.getInt("BOARD_ID"),
						rset.getString("BOARD_STATUS"),
						rset.getString("BOARD_WRITER"),
						rset.getString("NICKNAME"),						
						rset.getString("ONLINE_YN"),
						rset.getString("GATHER_PERIOD"),
						rset.getDate("ACCEPTANCE_START"),
						rset.getDate("ACCEPTANCE_END")
						);		
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return club;
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
	
	public int updateClub(Connection conn, Club updateClub) {
		PreparedStatement bPstmt = null;
		PreparedStatement cPstmt = null;
		int bResult = 0;
		int cResult = 0;
		int result = 0;
		
		String bQuery = prop.getProperty("updateBoard");
		String cQuery = prop.getProperty("updateClub");
		
		try {
			bPstmt = conn.prepareStatement(bQuery);
			bPstmt.setString(1, updateClub.getBoardTitle());
			bPstmt.setString(2, updateClub.getBoardContent());
			bPstmt.setInt(3, updateClub.getBoardNo());
			
			cPstmt = conn.prepareStatement(cQuery);
			cPstmt.setString(1, updateClub.getOnlineYn());
			cPstmt.setString(2, updateClub.getGatherPeriod());
			cPstmt.setDate(3, updateClub.getAcptStart());
			cPstmt.setDate(4, updateClub.getAcptEnd());
			cPstmt.setInt(5, updateClub.getBoardNo());
			
			bResult = bPstmt.executeUpdate();
			cResult = cPstmt.executeUpdate();
			
			result = bResult + cResult;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(cPstmt);
			close(bPstmt);
		}
		
		
		
		return result;
	}

	public int deleteClub(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;

		int result = 0;
		
		String query = prop.getProperty("deleteClub");

		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		System.out.println("dao : " + result);
		
		return result;
	}

	public ArrayList<Board> myBoardList(Connection conn, Page pi, String userId, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = prop.getProperty("myBoardList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;    // 페이징 블록 안 처음 게시행
		int endRow = startRow + pi.getBoardLimit() - 1;      // 페이징 블록 안 마지막 게시행	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_LIKE"),
						rset.getInt("BOARD_ID"),
						rset.getString("BOARD_STATUS"),
						rset.getString("BOARD_WRITER"),
						nickName
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

	public int getMyListCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getMyListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return listCount;		
	}
	
	public ArrayList<ChallengeBoard> selectCList(Connection conn, Page p) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ChallengeBoard> list = new ArrayList<>();
		
		String query = prop.getProperty("selectCList");
		
		System.out.println(p.getCurrentPage());
		System.out.println(p.getBoardLimit());
		
		int startRow = (p.getCurrentPage() -1) * p.getBoardLimit() +1;
		int endRow = startRow + p.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			System.out.println("startRow : " + startRow);
			System.out.println("endRow : " + endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ChallengeBoard cb = new ChallengeBoard(rset.getInt("BOARD_NO"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getDate("CREATE_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getInt("BOARD_COUNT"),
									rset.getInt("BOARD_LIKE"),
									rset.getInt("BOARD_ID"),
									rset.getString("BOARD_STATUS"),
									rset.getString("BOARD_WRITER"),
									rset.getString("NICKNAME"),
									rset.getString("CHAL_NAME"),
									rset.getString("CHAL_PLACE"));
				list.add(cb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getRListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getRListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public ArrayList<ReportBoard> selectReportList(Connection conn, Page p) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReportBoard> list = new ArrayList<>();
		
		String query = prop.getProperty("selectReportList");
		
		int startRow = (p.getCurrentPage() -1) * p.getBoardLimit() +1;
		int endRow = startRow + p.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReportBoard r = new ReportBoard(rset.getInt("REPORT_NO"),
												rset.getInt("REPORT_TYPE"),
												rset.getString("REPORT_CONTENT"),
												rset.getDate("REPORT_DATE"),
												rset.getString("USER_ID"),
												rset.getInt("BOARD_NO"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertReportBoard(Connection conn, ReportBoard r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getReportType());
			pstmt.setString(2, r.getReportContent());
			pstmt.setString(3, r.getReportUser());
			pstmt.setInt(4, r.getReportBNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertCBoard(Connection conn, ChallengeBoard c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getBoardTitle());
			pstmt.setString(2, c.getBoardContent());
			pstmt.setInt(3, c.getBoardId());
			pstmt.setString(4, c.getBoardWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertChallenge (Connection conn, ChallengeBoard c) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int result1 = 0;
		int result2 = 0;
		
		String query1 = prop.getProperty("insertBoard");
		String query2 = prop.getProperty("insertChallengeBoard");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, c.getBoardTitle());
			pstmt1.setString(2, c.getBoardContent());
			pstmt1.setInt(3, c.getBoardId());
			pstmt1.setString(4, c.getBoardWriter());
			
			result1 = pstmt1.executeUpdate();
			
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, c.getChalName());
			pstmt2.setString(2, c.getChalPlace());
			
			result2 = pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(pstmt2);
		}
		
		return result1+result2;
	}

	public int insertImage(Connection conn, ArrayList<Image> imageList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
		try {
			for(int i = 0; i < imageList.size(); i++) {
				Image img = imageList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, img.getChangeName());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getFileLevel());
				pstmt.setInt(5, img.getFileType());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//Recipe Image
	   public ArrayList<Image> selectImgList(Connection conn) {
		      Statement stmt = null;
		      ResultSet rset = null;
		      ArrayList<Image> list = null;
		      
		      String query = prop.getProperty("selectIList");
		      
		      try {
		         stmt = conn.createStatement();
		         rset = stmt.executeQuery(query);
		         
		         list = new ArrayList<Image>();
		         while(rset.next()) {
		            Image i = new Image();
		            i.setBoardNo(rset.getInt("BOARD_NO"));
		            i.setChangeName(rset.getString("CHANGE_NAME"));
		            
		            list.add(i);
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(stmt);
		      }
		      return list;
		   }
	   //Recipe
	   public ArrayList<Image> selectImages(Connection conn, int bNo) {
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      ArrayList<Image> imgList = null;
		      
		      String query = prop.getProperty("selectImages");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setInt(1, bNo);
		         rset = pstmt.executeQuery();
		         imgList = new ArrayList<Image>();
		         
		         while(rset.next()) {
		            Image img = new Image();
		            img.setFileNo(rset.getInt("FILE_NO"));
		            img.setChangeName(rset.getString("CHANGE_NAME"));
		            img.setOriginName(rset.getString("ORIGIN_NAME"));
		            img.setFilePath(rset.getString("FILE_PATH"));
		            img.setUploadDate(rset.getDate("UPLOAD_DATE"));
		            
		            imgList.add(img);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return imgList;
		   }
	   
	   public Recipe selectRecipe(Connection conn, int bNo) {
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      Recipe r = null;
		      String query = prop.getProperty("selectRecipe");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setInt(1, bNo);
		         rset = pstmt.executeQuery();
		         if(rset.next()) {            
		            r = new Recipe(rset.getInt("BOARD_NO"),
		                       rset.getString("BOARD_TITLE"),
		                       rset.getString("BOARD_CONTENT"),
		                       rset.getDate("CREATE_DATE"),
		                       rset.getDate("MODIFY_DATE"),
		                       rset.getInt("BOARD_COUNT"),
		                       rset.getInt("BOARD_LIKE"),
		                       rset.getInt("BOARD_ID"),
		                       rset.getString("BOARD_STATUS"),
		                       rset.getString("BOARD_WRITER"),
		                       rset.getString("NICKNAME"),
		                       rset.getString("MENU_NAME"),
		                       rset.getString("INGREDIENT"));   
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return r;
		   }

	
	//Challenge Image
	public ArrayList<Image> selectImageList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Image> list = null;
		
		String query = prop.getProperty("selectImageList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Image>();
			
			while(rset.next()) {
				Image img = new Image();
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setBoardNo(rset.getInt("BOARD_NO"));
				
				list.add(img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	  public int insertRecipe(Connection conn, Recipe r) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	   
	      String query = prop.getProperty("insertRecipe");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, r.getBoardTitle());
	         pstmt.setString(2, r.getBoardContent());
//	         pstmt.setInt(1, r.getBoardId());
	         pstmt.setString(3, r.getBoardWriter());
	         pstmt.setString(4, r.getMenuName());
	         pstmt.setString(5, r.getIngredient());
	         
	         result = pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }


	public ChallengeBoard selectCboard(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ChallengeBoard cboard = null;
		
		String query = prop.getProperty("selectCboard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cboard = new ChallengeBoard(rset.getInt("board_no"),
											rset.getString("board_title"),
											rset.getString("board_content"),
											rset.getDate("create_date"),
											rset.getDate("modify_date"),
											rset.getInt("board_count"),
											rset.getInt("board_like"),
											rset.getInt("board_id"),
											rset.getString("board_status"),
											rset.getString("board_writer"),
											rset.getString("nickname"),
											rset.getString("chal_name"),
											rset.getString("chal_place"));
			System.out.println("cboard"+cboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cboard;
	}

	public ReportBoard selectReportBoard(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReportBoard rboard = null;
		
		String query = prop.getProperty("selectReport");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rboard = new ReportBoard(rset.getInt("REPORT_NO"),
										 rset.getInt("REPORT_TYPE"),
										 rset.getString("REPORT_CONTENT"),
										 rset.getDate("REPORT_DATE"),
										 rset.getString("USER_ID"),
										 rset.getInt("BOARD_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rboard;
	}

	   public int insertNews(Connection conn, News n) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("insertNews");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, n.getBoardTitle());
		         pstmt.setString(2, n.getBoardContent());
		         pstmt.setString(3, n.getBoardWriter());
		         pstmt.setString(4, n.getNewsReference());
		         pstmt.setString(5, n.getNewsCategory());
		         
		         result = pstmt.executeUpdate();
		      
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      
		      return result;
		   }

	   public int newsUpdate(Connection conn, News n) {
		      PreparedStatement pstmt = null, pstmt2 = null;
		   
		      int result1 = 0;
		      int result2 = 0;
		      
		      String query1 = prop.getProperty("newsUpdate1");
		      String query2 = prop.getProperty("newsUpdate2");
		      
		      try {
		         pstmt = conn.prepareStatement(query1);
		         pstmt.setString(1, n.getBoardTitle());
		         pstmt.setString(2, n.getBoardContent());
		         pstmt.setInt(3, n.getBoardNo());
		         
		         result1 = pstmt.executeUpdate();
		         
		         pstmt2 = conn.prepareStatement(query2);
		         pstmt2.setString(1, n.getNewsReference());
		         pstmt2.setString(2, n.getNewsCategory());
		         pstmt2.setInt(3, n.getBoardNo());
		         
		         result2 = pstmt2.executeUpdate();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		         close(pstmt2);
		      }
		      
		      
		      return result1 + result2;
		   }

	   public int newsdelete(Connection conn, int bId) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("newsDelete");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setInt(1, bId);
		         
		         result = pstmt.executeUpdate();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      return result;
		   }
	   
	   
	
	public Board selectRBoard(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = new Board();
		
		String query = prop.getProperty("selectRBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(rset.getInt("BOARD_NO"),
								rset.getString("BOARD_TITLE"),
								rset.getString("BOARD_CONTENT"),
								rset.getInt("BOARD_ID"),
								rset.getString("BOARD_WRITER"));
			}
			System.out.println("board = " + board);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return board;
	}

	public ArrayList<Image> selectFiles(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> fileList = null;
		
		String query = prop.getProperty("selectFiles");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			fileList = new ArrayList<Image>();
			
			while(rset.next()) {
				Image img = new Image();
				img.setFileNo(rset.getInt("FILE_NO"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				fileList.add(img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fileList;
	}

	public int updateImage(Connection conn, ArrayList<Image> imageList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateImage");
		
		try {
			for(int i = 0; i < imageList.size(); i++) {
				Image img = imageList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, img.getChangeName());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getFileNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCBoard(Connection conn, ChallengeBoard c) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int result1 = 0;
		int result2 = 0;
		
		String query1 = prop.getProperty("updateBoard");
		String query2 = prop.getProperty("updateChallengeBoard");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, c.getBoardTitle());
			pstmt1.setString(2, c.getBoardContent());
			pstmt1.setInt(3, c.getBoardNo());
			
			result1 = pstmt1.executeUpdate();
			
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, c.getChalName());
			pstmt2.setString(2, c.getChalPlace());
			pstmt2.setInt(3, c.getBoardNo());
			
			result2 = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(pstmt2);
		}
		
		return result1 + result2;
	}

	public int deleteBoard(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
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
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}
	


	   public ArrayList<ChallengeBoard> searchChallengeBoard(Connection conn, String keyword) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ChallengeBoard board = null;
	      ArrayList<ChallengeBoard> list = new ArrayList<ChallengeBoard>();
	      
	      
	      String query = prop.getProperty("searchChallengeBoard");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, "%" + keyword + "%");
	         pstmt.setString(2, "%" + keyword + "%");
	         pstmt.setString(3, "%" + keyword + "%");
	         pstmt.setString(4, "%" + keyword + "%");
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            board = new ChallengeBoard(rset.getInt("board_no"),
	                                 rset.getString("board_title"),
	                                 rset.getString("board_content"),
	                                 rset.getDate("create_date"),
	                                 rset.getDate("modify_date"),
	                                 rset.getInt("board_count"),
	                                 rset.getInt("board_like"),
	                                 rset.getInt("board_id"),
	                                 rset.getString("board_status"),
	                                 rset.getString("board_writer"),
	                                 rset.getString("nickname"),
	                                 rset.getString("chal_name"),
	                                 rset.getString("chal_place"));
	            list.add(board);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }

	   public int getSearchListCount(Connection conn, String keyword) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int result = 0;
	      
	      String query = prop.getProperty("searchChalListCount");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, "%" + keyword + "%");
	         pstmt.setString(2, "%" + keyword + "%");
	         pstmt.setString(3, "%" + keyword + "%");
	         pstmt.setString(4, "%" + keyword + "%");
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            result = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rset);
	      }
	      
	      return result;
	   }	
	
	
	
	   public ArrayList<Recipe> selectRecList(Connection conn, Page p) {
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      ArrayList<Recipe> list = new ArrayList<>();

		      String query = prop.getProperty("selectRList");
		      System.out.println("커런트 페이지" + p.getCurrentPage());
		      System.out.println("보드리밋 " + p.getBoardLimit());

		      int startRow = (p.getCurrentPage() - 1) * p.getBoardLimit() + 1;
		      int endRow = startRow + p.getBoardLimit() - 1;

		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setInt(1, startRow);
		         pstmt.setInt(2, endRow);
		         System.out.println("startRow : " + startRow);
		         System.out.println("endRow : " + endRow);
		         rset = pstmt.executeQuery();

		         rset = pstmt.executeQuery();

//		            list = new ArrayList<Recipe>();

		         while (rset.next()) {
		            Recipe r = new Recipe(rset.getInt("BOARD_NO"), rset.getString("BOARD_TITLE"),
		                  rset.getString("BOARD_CONTENT"), rset.getDate("CREATE_DATE"), rset.getDate("MODIFY_DATE"),
		                  rset.getInt("BOARD_COUNT"), rset.getInt("BOARD_LIKE"), rset.getInt("BOARD_ID"),
		                  rset.getString("BOARD_STATUS"), rset.getString("BOARD_WRITER"), rset.getString("NICKNAME"),
		                  rset.getString("MENU_NAME"), rset.getString("INGREDIENT"));
		            list.add(r);
		         }

		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return list;
		   }

			
	
	
	
	
	
	
	
	
	
	
	
}
