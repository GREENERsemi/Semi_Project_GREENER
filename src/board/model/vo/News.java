package board.model.vo;

import java.sql.Date;

public class News extends Board{
	private String newsReference;
	private String newsCategory;
   
	public News() {}

	public News(int boardNo, String boardTitle, String boardContent, int boardId, String boardWriter, String newsReference,
			String newsCategory) {
		super(boardNo, boardTitle, boardContent, boardId, boardWriter);
		this.newsReference = newsReference;
		this.newsCategory = newsCategory;
	}
	
	public String getNewsReference() {
		return newsReference;
	}
	
	public void setNewsReference(String newsReference) {
		this.newsReference = newsReference;
	}
	
	public String getNewsCategory() {
		return newsCategory;
	}
	
	public void setNewsCategory(String newsCategory) {
		this.newsCategory = newsCategory;
	}
	
	@Override
	public String toString() {
		return super.toString() + "News [newsReference=" + newsReference + ", newsCategory=" + newsCategory + "]";
	}

	public News(int boardNo, String boardTitle, String boardContent, Date createDate, Date modifyDate, int boardCount,
			int boardLike, int boardId, String boardStatus, String boardWriter, String nickName, String newsReference,
			String newsCategory) {
		super(boardNo, boardTitle, boardContent, createDate, modifyDate, boardCount, boardLike, boardId, boardStatus,
				boardWriter, nickName);
		this.newsReference = newsReference;
		this.newsCategory = newsCategory;
	}

   
}