package org.kh.hw.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.service.NoticeService;
import org.kh.hw.notice.store.NoticeStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Notice> printAll(PageInfo pi) {
		List<Notice> nList = nStore.selectAll(sqlSession, pi);
		return nList;
	}
	
	@Override
	public int registerNotice(Notice notice) {
		int result = nStore.insertNotice(sqlSession, notice);
		return result;
	}

	@Override
	public int getListCount() {
		int totalCount = nStore.selectListCount(sqlSession);
		return totalCount;
	}

	@Override
	public Notice printOneByNo(Integer noticeNo) {
		Notice notice = nStore.selectOneByNo(sqlSession, noticeNo);
		return notice;
	}

	@Override
	public int modifyNotice(Notice notice) {
		int result = nStore.updateNotice(sqlSession, notice);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(sqlSession, noticeNo);
		return result;
	}

	@Override
	public int updateCount(int noticeNo) {
		int result = nStore.updateCount(sqlSession, noticeNo);
		return result;
	}


}
