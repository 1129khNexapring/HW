package org.kh.hw.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.qna.domain.PageInfo;
import org.kh.hw.qna.domain.Qna;

public interface QnaStore {
   public int selectListCount(SqlSession sqlSession);
   public List<Qna> selectAll(SqlSession sqlSession, PageInfo pi);
   public Qna selectOneByNo(SqlSession sqlSession, Integer qnaNo);
   public int insertQna(SqlSession sqlSession, Qna qna);
   public int updateQna(SqlSession session, Qna qna);
   public int deleteQna(SqlSession sqlSession, int qnaNo);
   public int updateCount(SqlSession sqlSession , int qnaNo);
   public Qna selectQnaLogin(SqlSession sqlSession, Qna qna);
   public int adminInsertQna(SqlSession sqlSession, Qna qna);
   public int adminUpdateQna(SqlSession sqlSession, int qnaNo);
   public List<Qna> selectAllById(SqlSession sqlSession, String qnaWriter);
   

}