package org.kh.hw.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;

public interface NoticeStore {

	public int selectListCount(SqlSession sqlSession);
	public List<Notice> selectAll(SqlSession sqlSession, PageInfo pi);
	public Notice selectOneByNo(SqlSession sqlSession, Integer noticeNo);
	public int insertNotice(SqlSession sqlSession, Notice notice);
	public int updateNotice(SqlSession sqlSession , Notice notice);
	public int deleteNotice(SqlSession sqlSession , int noticeNo);
	public int updateCount(SqlSession sqlSession , int noticeNo);
	
}
