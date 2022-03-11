package org.kh.hw.history.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.history.domain.History;
import org.kh.hw.notice.domain.PageInfo;

public interface HistoryStore {

	public int insertMember(SqlSession sqlSession, History history);

	public History selectOneByNo(SqlSession sqlSession, String resNo);

	public int selectListCount(SqlSession sqlSession);
	
	public List<History> selectAll(SqlSession sqlSession, PageInfo pi);

	public int updateHistory(SqlSession sqlSession, History history);

	public List<History> selectAllById(SqlSession sqlSession, String memberId);


}
