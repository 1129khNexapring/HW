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
		int result = hStore.insertHistory(sqlSession, history);
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
	public List<History> printAll(PageInfo pi, String doctorId) {
		List<History> hList = hStore.selectAll(sqlSession, pi, doctorId);
		return hList;
	}

	@Override
	public List<History> printAllById(String memberId) {
		List<History> result = hStore.selectAllById(sqlSession, memberId);
		return result;
	}

	@Override
	public int removeHistory(String resNo) {
		int result = hStore.deleteHistory(sqlSession, resNo);
		return result;
	}


}