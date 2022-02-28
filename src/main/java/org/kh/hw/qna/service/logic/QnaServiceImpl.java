package org.kh.hw.qna.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.qna.domain.PageInfo;
import org.kh.hw.qna.domain.Qna;
import org.kh.hw.qna.service.QnaService;
import org.kh.hw.qna.store.QnaStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{
   @Autowired
   private QnaStore qStore;
   @Autowired
   private SqlSession sqlSession;
   
   
   @Override
   public int getListCount() {
      int toalCount = qStore.selectListCount(sqlSession);
      return toalCount;
   }

   @Override
   public List<Qna> printAll(PageInfo pi) {
      List<Qna> qList = qStore.selectAll(sqlSession, pi);
      return qList;
   }
   
   @Override
   public Qna printOneByNo(Integer qnaNo) {
      Qna qna = qStore.selectOneByNo(sqlSession, qnaNo);
      return qna;
   }
   
    
   @Override
   public int registerQna(Qna qna) {
      int result = qStore.insertQna(sqlSession, qna);
      return result;
   }
   
   @Override
   public int modifyQna(Qna qna) {
      int result = qStore.updateQna(sqlSession, qna);
      return result;
   }

   
   @Override
      public int removeQna(int qnaNo) {
         int result = qStore.deleteQna(sqlSession, qnaNo);
         return result;
      }
   
   @Override
   public int updateCount(int qnaNo) {
      int result = qStore.updateCount(sqlSession, qnaNo);
      return result;
   }
   
   @Override
      public Qna qnaLogin(Qna qna) {
         Qna result = qStore.selectQnaLogin(sqlSession, qna);
         return result;
      }

   @Override
   public int adminInsertQna(Qna qna) {
      int result = qStore.adminInsertQna(sqlSession, qna);
      if(result > 0) {
         result += qStore.adminUpdateQna(sqlSession, qna.getFkSeq());
      }
      return result;
   }

   @Override
   public List<Qna> printAllById(String qnaWriter) {
      List<Qna> result = qStore.selectAllById(sqlSession, qnaWriter);
      return result;
   }
   
   
   
   
   
   
   

}