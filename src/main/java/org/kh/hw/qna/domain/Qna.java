package org.kh.hw.qna.domain;

import java.sql.Date;

public class Qna {
   private int qnaNo;
   private String qnaTitle;
   private String qnaContent;
   private String qnaType;
   private String qnaWriter;
   private String qnaPw;
   private String qnaAnswer;
   private Date qnaDate;
   private int qnaCount;
   private int groupNo;
   private int fkSeq;
   private int depthNo;
   private String qnaStatus;
   
   public Qna() {}

   public Qna(int qnaNo, String qnaTitle, String qnaContent, String qnaType, String qnaWriter, String qnaPw,
         String qnaAnswer, Date qnaDate, int qnaCount, int groupNo, int fkSeq, int depthNo, String qnaStatus) {
      super();
      this.qnaNo = qnaNo;
      this.qnaTitle = qnaTitle;
      this.qnaContent = qnaContent;
      this.qnaType = qnaType;
      this.qnaWriter = qnaWriter;
      this.qnaPw = qnaPw;
      this.qnaAnswer = qnaAnswer;
      this.qnaDate = qnaDate;
      this.qnaCount = qnaCount;
      this.groupNo = groupNo;
      this.fkSeq = fkSeq;
      this.depthNo = depthNo;
      this.qnaStatus = qnaStatus;
   }

   public int getQnaNo() {
      return qnaNo;
   }

   public void setQnaNo(int qnaNo) {
      this.qnaNo = qnaNo;
   }

   public String getQnaTitle() {
      return qnaTitle;
   }

   public void setQnaTitle(String qnaTitle) {
      this.qnaTitle = qnaTitle;
   }

   public String getQnaContent() {
      return qnaContent;
   }

   public void setQnaContent(String qnaContent) {
      this.qnaContent = qnaContent;
   }

   public String getQnaType() {
      return qnaType;
   }

   public void setQnaType(String qnaType) {
      this.qnaType = qnaType;
   }

   public String getQnaWriter() {
      return qnaWriter;
   }

   public void setQnaWriter(String qnaWriter) {
      this.qnaWriter = qnaWriter;
   }

   public String getQnaPw() {
      return qnaPw;
   }

   public void setQnaPw(String qnaPw) {
      this.qnaPw = qnaPw;
   }

   public String getQnaAnswer() {
      return qnaAnswer;
   }

   public void setQnaAnswer(String qnaAnswer) {
      this.qnaAnswer = qnaAnswer;
   }

   public Date getQnaDate() {
      return qnaDate;
   }

   public void setQnaDate(Date qnaDate) {
      this.qnaDate = qnaDate;
   }

   public int getQnaCount() {
      return qnaCount;
   }

   public void setQnaCount(int qnaCount) {
      this.qnaCount = qnaCount;
   }

   public int getGroupNo() {
      return groupNo;
   }

   public void setGroupNo(int groupNo) {
      this.groupNo = groupNo;
   }

   public int getFkSeq() {
      return fkSeq;
   }

   public void setFkSeq(int fkSeq) {
      this.fkSeq = fkSeq;
   }

   public int getDepthNo() {
      return depthNo;
   }

   public void setDepthNo(int depthNo) {
      this.depthNo = depthNo;
   }

   public String getQnaStatus() {
      return qnaStatus;
   }

   public void setQnaStatus(String qnaStatus) {
      this.qnaStatus = qnaStatus;
   }

   @Override
   public String toString() {
      return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaType=" + qnaType
            + ", qnaWriter=" + qnaWriter + ", qnaPw=" + qnaPw + ", qnaAnswer=" + qnaAnswer + ", qnaDate=" + qnaDate
            + ", qnaCount=" + qnaCount + ", groupNo=" + groupNo + ", fkSeq=" + fkSeq + ", depthNo=" + depthNo
            + ", qnaStatus=" + qnaStatus + "]";
   }
   
}