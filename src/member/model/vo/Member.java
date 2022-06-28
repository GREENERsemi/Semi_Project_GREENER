package member.model.vo;

import java.sql.Date;

public class Member {
   private String userId;
   private String userPwd;
   private String userName;
   private String nickName;
   private String email;
   private String phone;
   private String birthDate;
   private String status;
   private String manager;
   private String pwdConfirm;
   private Date createDate;
   private Date modifyDate;
   
   //추가
   private int pwdQuestion;
   
   public Member() {}

   public Member(String userId, String userPwd, String userName, String nickName, String email, String phone,
         String birthDate, String status, String manager, String pwdConfirm, Date createDate, Date modifyDate, int pwdQuestion) {
      super();
      this.userId = userId;
      this.userPwd = userPwd;
      this.userName = userName;
      this.nickName = nickName;
      this.email = email;
      this.phone = phone;
      this.birthDate = birthDate;
      this.status = status;
      this.manager = manager;
      this.pwdConfirm = pwdConfirm;
      this.createDate = createDate;
      this.modifyDate = modifyDate;
      this.pwdQuestion = pwdQuestion;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getUserPwd() {
      return userPwd;
   }

   public void setUserPwd(String userPwd) {
      this.userPwd = userPwd;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getBirthDate() {
      return birthDate;
   }

   public void setBirthDate(String birthDate) {
      this.birthDate = birthDate;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getManager() {
      return manager;
   }

   public void setManager(String manager) {
      this.manager = manager;
   }

   public String getPwdConfirm() {
      return pwdConfirm;
   }

   public void setPwdConfirm(String pwdConfirm) {
      this.pwdConfirm = pwdConfirm;
   }

   public Date getCreateDate() {
      return createDate;
   }

   public void setCreateDate(Date createDate) {
      this.createDate = createDate;
   }

   public Date getModifyDate() {
      return modifyDate;
   }

   public void setModifyDate(Date modifyDate) {
      this.modifyDate = modifyDate;
   }

   public int getPwdQuestion() {
      return pwdQuestion;
   }
   
   public void setPwdQuestion(int pwdQuestion) {
      this.pwdQuestion = pwdQuestion;
   }

   @Override
   public String toString() {
      return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
            + ", email=" + email + ", phone=" + phone + ", birthDate=" + birthDate + ", status=" + status
            + ", manager=" + manager + ", pwdConfirm=" + pwdConfirm + ", createDate=" + createDate + ", modifyDate="
            + modifyDate + ", pwdQuestion=" + pwdQuestion + "]";
   }

}
   
   