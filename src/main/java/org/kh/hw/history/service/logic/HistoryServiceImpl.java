package org.kh.hw.history.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.history.domain.History;
import org.kh.hw.history.service.HistoryService;
import org.kh.hw.history.store.HistoryStore;
import org.kh.hw.notice.domain.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryServiceImpl implements HistoryService {
	@Autowired
	private HistoryStore hStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int registerHistory(History history) {
		int result = hStore.insertMember(sqlSession, history);
		return result;
	}

	@Override
	public History printOneByNo(String resNo) {
		History history = hStore.selectOneByNo(sqlSession, resNo);
		return history;
	}

	@Override
	public int getListCount() {
		int totalCount = hStore.selectListCount(sqlSession);
		return totalCount;
	}

	@Override
	public List<History> printAll(PageInfo pi) {
		List<History> hList = hStore.selectAll(sqlSession, pi);
		return hList;
	}

	@Override
	public int modifyHistory(History history) {
		int result = hStore.updateHistory(sqlSession, history);
		return result;
	}

	@Override
	public int updateHistory(SqlSession sqlSession, History history) {
		int result = sqlSession.delete("HistoryMapper.deleteHistory", history);
		return result;
	}

//	@Override
//	public int modifyHistory(History history) {
//		int result = hStore.updateMember(sqlSession, history);
//		return result;
//	}
//
//	@Override
//	public int removeHistory(String doctorId) {
//		int result = hStore.deleteMember(sqlSession, doctorId);
//		return result;
//	}
}