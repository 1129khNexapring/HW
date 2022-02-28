package org.kh.hw.notice.service;
import java.util.List;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;

public interface NoticeService {

	public int getListCount();
	public List<Notice>printAll(PageInfo pi);
	public Notice printOneByNo(Integer noticeNo);
	public int registerNotice(Notice notice);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNo);
	public int updateCount(int noticeNo);
}