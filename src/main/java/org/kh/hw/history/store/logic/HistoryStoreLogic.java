package org.kh.hw.history.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.history.domain.History;
import org.kh.hw.history.store.HistoryStore;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.springframework.stereotype.Repository;

@Repository
public class HistoryStoreLogic implements HistoryStore{

	@Override
	public int insertMember(SqlSession sqlSession, History history) {
		int result = sqlSession.insert("HistoryMapper.insertHistory", history);
		return result;
	}

	@Override
	public History selectOneByNo(SqlSession sqlSession, String resNo) {
		History history = sqlSession.selectOne("HistoryMapper.selectOneByNo", resNo);
		return history;
	}
	@Override
	public int selectListCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("HistoryMapper.selectListCount");
		return totalCount;
	}
	@Override
	public List<History> selectAll(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getNoticeLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<History> hList = sqlSession.selectList("HistoryMapper.selectAllList", pi, rowBounds);
		return hList;
	}

	@Override
	public int updateHistory(SqlSession sqlSession, History history) {
		int result = sqlSession.update("HistoryMapper.updateHistory", history);
		return result;
	}

//	@Override
//	public int updateMember(SqlSession sqlSession, History history) {
//		int result = sqlSession.update("HistoryMapper.updateHistory", history);
//		return result;
//	}
//
//	@Override
//	public int deleteMember(SqlSession sqlSession, String doctorId) {
//		int result = sqlSession.delete("HistoryMapper.deleteHistory", doctorId);
//		return result;
//	}
}