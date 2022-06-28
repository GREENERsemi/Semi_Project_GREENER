package board.model.vo;

import java.sql.Date;

public class Image {
   private int fileNo;            
   private String changeName;
   private String originName;
   private String filePath;      //경로명
   private Date uploadDate;      //등록일
   private int fileLevel;         //썸네일 여부
   private String imageStatus;      //게시물 노출여부,,, 이게 뭐더라..
   private int fileType;	//게시판 구분(챌린지:1/레시피:2)
   private int boardNo;		//글번호
   
   public Image() {}

   public Image(int fileNo, String changeName, String originName, String filePath, Date uploadDate, int fileLevel,
         String imageStatus, int fileType, int boardNo) {
      super();
      this.fileNo = fileNo;
      this.changeName = changeName;
      this.originName = originName;
      this.filePath = filePath;
      this.uploadDate = uploadDate;
      this.fileLevel = fileLevel;
      this.imageStatus = imageStatus;
      this.fileType = fileType;
      this.boardNo = boardNo;
   }

   	public int getFileType() {
   		return fileType;
	}
	
	public void setFileType(int fileType) {
		this.fileType = fileType;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	public int getFileNo() {
      return fileNo;
   }

   public void setFileNo(int fileNo) {
      this.fileNo = fileNo;
   }

   public String getChangeName() {
      return changeName;
   }

   public void setChangeName(String changeName) {
      this.changeName = changeName;
   }

   public String getOriginName() {
      return originName;
   }

   public void setOriginName(String originName) {
      this.originName = originName;
   }

   public String getFilePath() {
      return filePath;
   }

   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }

   public Date getUploadDate() {
      return uploadDate;
   }

   public void setUploadDate(Date uploadDate) {
      this.uploadDate = uploadDate;
   }

   public int getFileLevel() {
      return fileLevel;
   }

   public void setFileLevel(int fileLevel) {
      this.fileLevel = fileLevel;
   }

   public String getImageStatus() {
      return imageStatus;
   }

   public void setImageStatus(String imageStatus) {
      this.imageStatus = imageStatus;
   }

	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", changeName=" + changeName + ", originName=" + originName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", imageStatus=" + imageStatus
				+ ", fileType=" + fileType + ", boardNo=" + boardNo + "]";
	}

}