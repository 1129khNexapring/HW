package org.kh.hw.qna.service;

import java.util.List;

import org.kh.hw.qna.domain.PageInfo;
import org.kh.hw.qna.domain.Qna;

public interface QnaService {
   public int getListCount();

   public List<Qna> printAll(PageInfo pi);
   public Qna printOneByNo(Integer qnaNo);
   public List<Qna> printAllById(String qnaWriter);
   public int registerQna(Qna qna);
   public int modifyQna(Qna qna);
   public int removeQna(int qnaNo);
   public int updateCount(int qnaNo);
   public Qna qnaLogin(Qna qna);
   public int adminInsertQna(Qna qna);

}