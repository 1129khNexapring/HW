package org.kh.hw.history.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.history.domain.History;
import org.kh.hw.member.domain.Member;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;

public interface HistoryService {

	public int registerHistory(History history);

	public History printOneByNo(String resNo);

	public int getListCount();

	public List<History> printAll(PageInfo pi, String doctorId);

	public List<History> printAllById(String memberId);

	public int removeHistory(String resNo);
}