package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.ChallengeBoard;
import board.model.vo.Club;
import board.model.vo.Comment;
import board.model.vo.Image;
import board.model.vo.News;
import board.model.vo.Page;
import board.model.vo.Recipe;
import board.model.vo.ReportBoard;

public class BoardService {

	public ArrayList<Recipe> selectRecList(Page p) {
        Connection conn = getConnection();
        
        ArrayList<Recipe> list = new BoardDAO().selectRecList(conn, p);
        
        close(conn);
        
        return list;
     }

		   public int insertRecipe(Recipe r, ArrayList<Image> imageList) {
		      Connection conn = getConnection();

		      BoardDAO dao = new BoardDAO();

		      int result1 = dao.insertRecipe(conn, r);
		      int result2 = dao.insertImage(conn, imageList);

		      if (result1 > 0 && result2 > 0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      return result1 + result2;
		   }
		   
		   public ArrayList<Image> selectImages(int bNo) {
		      Connection conn = getConnection();
		      
		      ArrayList<Image> imgList = new BoardDAO().selectImages(conn, bNo); 

		      close(conn);
		         
		      return imgList;
		   }

		   public Recipe selectRecipe(int bNo) {
		      Connection conn = getConnection();
		      
		      int result = new BoardDAO().updateCount(conn, bNo);
		      Recipe r = null;
		      if(result > 0) {
		         r = new BoardDAO().selectRecipe(conn, bNo);
		         if(r != null) {
		            commit(conn);
		         } else {
		            rollback(conn);
		         }
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      return r;
		      
		   }

		   public ArrayList<News> selectList(Page pi) {
			      Connection conn = getConnection();
			      
			      ArrayList<News> list = new BoardDAO().selectList(conn, pi);
			      
			      close(conn);
			      
			      return list;
			   }

		   public News selectBoard(int bId) {
			      Connection conn = getConnection();
			      
			      int result = new BoardDAO().newsupdateCount(conn, bId);
			      News news = null;
			      
			      if(result > 0) {
			         news = new BoardDAO().selectBoard(conn, bId);
			         if(news != null) {
			            commit(conn);
			         } else {
			            rollback(conn);
			         }
			      }
			      return news;
			   }

		   public int insertNews(News n) {
			      Connection conn = getConnection();
			      
			      int result = new BoardDAO().insertNews(conn, n);
			      
			      System.out.println(result);
			      
			      if(result > 0) {
			         commit(conn);
			      } else {
			         rollback(conn);
			      }
			      
			      close(conn);
			      
			      return result;
			      
			   }

		   public int newsUpdate(News n) {
			      Connection conn = getConnection();
			      
			      int result = new BoardDAO().newsUpdate(conn, n);
			      
			      System.out.print(result);
			      
			      if(result > 1) {
			         commit(conn);
			      } else {
			         rollback(conn);
			      }
			      
			      return result;
			   }

		   public int newsdelete(int bId) {
			      Connection conn = getConnection();
			      
			      int result = new BoardDAO().newsdelete(conn, bId);
			      
			      if(result > 0) {
			         commit(conn);
			      } else {
			         rollback(conn);
			      }
			      return result;
			   }
		   
		   public ArrayList<Comment> selectCommentList(int bNo) {
		      Connection conn = getConnection();
		      
		      ArrayList<Comment> comList = new BoardDAO().selectCommentList(conn, bNo);
		      
		      close(conn);
		      
		      return comList;
		   }

		   public ArrayList<Comment> insertComment(Comment com) {
		      Connection conn = getConnection();
		      
		      BoardDAO dao = new BoardDAO();
		      
		      int result = dao.insertComment(conn, com);
		      ArrayList<Comment> comList = null;
		      if(result > 0) {
		         commit(conn);
		         comList = dao.selectCommentList(conn, com.getBoardNo());
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      return comList;
		   }

		   
	
	public int getListCount3() {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getListCount3(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public int getListCount5() {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getListCount5(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<ChallengeBoard> selectCList(Page p) {
		Connection conn = getConnection();
		
		ArrayList<ChallengeBoard> list = new BoardDAO().selectCList(conn, p);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Image> selectImageList() {
		Connection conn = getConnection();
		
		ArrayList<Image> list = new BoardDAO().selectImageList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ReportBoard> selectReportList(Page p) {
		Connection conn = getConnection();
		
		ArrayList<ReportBoard> list = new BoardDAO().selectReportList(conn, p);
		
		close(conn);
		
		return list;
	}

	public int getRListCount() {
		Connection conn = getConnection();
		
		int RlistCount = new BoardDAO().getRListCount(conn);
		
		close(conn);
		
		return RlistCount;
	}

	public int insertReportBoard(ReportBoard r) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertReportBoard(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertImage(ChallengeBoard c, ArrayList<Image> imageList) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertChallenge(conn, c);
//		int result3 = dao.insertCBoard(conn,c);
		int result2 = dao.insertImage(conn, imageList);
		
		if(result1 > 1 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 + result2;
	}

	   public ChallengeBoard selectChallengeBoard(int bNo) {
		      Connection conn = getConnection();
		      
		      //challengeBoard 조회수 업데이트
		      int result = new BoardDAO().updateCount(conn, bNo);
		      
		      ChallengeBoard cboard = null;
		      if(result > 0) {
		         cboard = new BoardDAO().selectCboard(conn, bNo);
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      
		      return cboard;
		   }

	public ReportBoard selectReportBoard(int rNo) {
		Connection conn = getConnection();
		
		ReportBoard rboard = new BoardDAO().selectReportBoard(conn, rNo);
		
		if(rboard != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return rboard;
	}

	public Board selectRBoard(int rNo) {
		Connection conn = getConnection();
		
		Board board = new BoardDAO().selectRBoard(conn, rNo);
		
		close(conn);
		
		return board;
	}

	public ArrayList<Image> selectFiles(int bNo) {
		Connection conn = getConnection();
		
		ArrayList<Image> fileList = new BoardDAO().selectFiles(conn, bNo);
		
		close(conn);
		
		return fileList;
	}

	public int updateImage(ArrayList<Image> imageList) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateImage(conn, imageList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateCBoard(ChallengeBoard c) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateCBoard(conn, c);
		
		if(result > 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteBoard(int bNo) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteBoard(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int getClubListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getClubListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Club> selectClubList(Page pi) {
		Connection conn = getConnection();
		
		ArrayList<Club> selectList = new BoardDAO().selectClubList(conn, pi);
		
		close(conn);
		return selectList;
	}

	public int insertClub(Club club) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertClub(conn, club);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public Club selectClub(int no) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateCount(conn, no);
		Club club = null;
		
		if(result>0) {
			club = new BoardDAO().selectClub(conn, no);
			if(club != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
	
		
		close(conn);
		return club;
	}

	public int updateClub(Club updateClub) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateClub(conn, updateClub);
		
		if(result>1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteClub(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteClub(conn, boardNo);
		
		System.out.println("service : " + boardNo);	
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		

		System.out.println("service : " + result);
		
		return result;
	}


	public ArrayList<Board> myBoardList(Page pi, String userId, String nickName) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().myBoardList(conn, pi, userId, nickName);
		
		close(conn);
		return list;
	}

	public int getMyListCount(String userId) {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getMyListCount(conn, userId);
		
		close(conn);
		return listCount;			
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}


	   public ArrayList<ChallengeBoard> searchChallengeBoard(String keyword) {
	      Connection conn = getConnection();
	      
	      ArrayList<ChallengeBoard> list = new BoardDAO().searchChallengeBoard(conn, keyword);
	      
	      close(conn);
	      
	      return list;
	   }

	   public int getSearchListCount(String keyword) {
	      Connection conn = getConnection();
	      
	      int listCount = new BoardDAO().getSearchListCount(conn, keyword);
	      
	      close(conn);
	      
	      return listCount;
	   }
}
