package org.kh.hw.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.qna.domain.PageInfo;
import org.kh.hw.qna.domain.Qna;
import org.kh.hw.qna.store.QnaStore;
import org.springframework.stereotype.Repository;

@Repository
public class QnaStoreLogic implements QnaStore{
   
   @Override
   public int selectListCount(SqlSession sqlSession) {
      int totalCount = sqlSession.selectOne("QnaMapper.selectListCount");
      return totalCount;
   }
   
   @Override
   public List<Qna> selectAll(SqlSession sqlSession, PageInfo pi) {
      int limit = pi.getQnaLimit();
      int currentPage = pi.getCurrentPage();
      int offset = (currentPage - 1) * limit;
      RowBounds rowBounds = new RowBounds(offset, limit);
      List<Qna> qList = sqlSession.selectList("QnaMapper.selectAllList", pi, rowBounds);
      return qList;
   }
   
   @Override
   public Qna selectOneByNo(SqlSession sqlSession, Integer qnaNo) {
      Qna qna = sqlSession.selectOne("QnaMapper.selectOneByNo",qnaNo);
      return qna;
   }

   
   @Override
   public int insertQna(SqlSession sqlSession, Qna qna) {
      int result = sqlSession.insert("QnaMapper.insertQna", qna);
      return result;
   }
   
   @Override
   public int updateQna(SqlSession session, Qna qna) {
      int result = session.update("QnaMapper.updateQna", qna);
      return result;
   }
   @Override
   public int updateCount(SqlSession sqlSession, int qnaNo) {
      int result = sqlSession.update("QnaMapper.updateCount", qnaNo);
      return result;
   }
   @Override
      public int deleteQna(SqlSession sqlSession, int qnaNo) {
         int result = sqlSession.delete("QnaMapper.deleteQna", qnaNo);
         return result;
      }
   @Override
      public Qna selectQnaLogin(SqlSession sqlSession, Qna qna) {
         Qna result = sqlSession.selectOne("QnaMapper.selectQna", qna);
         return result;
      }

   @Override
   public int adminInsertQna(SqlSession sqlSession, Qna qna) {
      int result = sqlSession.insert("QnaMapper.adminInsertQna", qna);
      return result;
   }
   
   @Override
   public int adminUpdateQna(SqlSession sqlSession, int qnaNo) {
      int result = sqlSession.insert("QnaMapper.adminUpdateQna", qnaNo);
      return result;
   }

   @Override
   public List<Qna> selectAllById(SqlSession sqlSession, String qnaWriter) {
      List<Qna> result = sqlSession.selectList("QnaMapper.selectQnaById", qnaWriter);
      return result;
   }


   
   

   



}