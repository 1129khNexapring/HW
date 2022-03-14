package org.kh.hw.history.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.history.domain.History;
import org.kh.hw.notice.domain.PageInfo;

public interface HistoryStore {

	public int insertHistory(SqlSession sqlSession, History history);

	public History selectOneByNo(SqlSession sqlSession, String resNo);

	public int selectListCount(SqlSession sqlSession);
	
	public List<History> selectAll(SqlSession sqlSession, PageInfo pi, String doctorId);

	public List<History> selectAllById(SqlSession sqlSession, String memberId);

	public int deleteHistory(SqlSession sqlSession, String resNo);


}
