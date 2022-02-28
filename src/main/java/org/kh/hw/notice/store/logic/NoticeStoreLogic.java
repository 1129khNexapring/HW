package org.kh.hw.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.store.NoticeStore;
import org.springframework.stereotype.Repository;
@Repository
public class NoticeStoreLogic implements NoticeStore{
	
	@Override
	public List<Notice> selectAll(SqlSession sqlSession, PageInfo pi) {
		//쿼리문 변경없이 할 수 있도록 마이바티스 기능이 있음
		//ROWBOUNDS 클래스를 통해서 쿼리문을 변경하지 않고 페이징 처리(5개씩, 10개씩) 게시물을 조회해옴
		//offset -> 시작값  , limit->게시물의 개수
		//1 -> 1 ~ 10
		//2 -> 11 ~ 20
		
		/**
		 *  RowBounds는 쿼리문을 변경하지 않고도 페이징을 처리할 수 있게 해주는 클래스
		 *  RowBounds의 동작은 offset값과 limit값을 이용해서 동작함
		 *  offset값은 변하는 값이고 limit값은 고정값
		 *  limit값이 한 페이지당 보여주고 싶은 게시물의 갯수이고
		 *  offset은 건너뛰어야 할 값임
		 *  ex) limit 10, offset 0,  1~10
		 *  			  offset 10, 11~20
		 *  offset값은 currentPage에 의해서 변경됨
		 */

		
		int limit = pi.getNoticeLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> nList = sqlSession.selectList("NoticeMapper.selectAllList", pi, rowBounds);
		return nList;
	}
	@Override
	public int selectListCount(SqlSession sqlSession ) {
		int totalCount = sqlSession.selectOne("NoticeMapper.selectListCount");
		return totalCount;
	}
	
	@Override
	public Notice selectOneByNo(SqlSession sqlSession, Integer noticeNo) {
		Notice notice = sqlSession.selectOne("NoticeMapper.selectOneByNo", noticeNo);
		return notice;
	}
	@Override
	public int insertNotice(SqlSession sqlSession, Notice notice) {
		int result = sqlSession.insert("NoticeMapper.insertNotice", notice);
		return result;
	}
	@Override
	public int updateNotice(SqlSession sqlSession, Notice notice) {
		int result = sqlSession.update("NoticeMapper.updateNotice", notice);
		return result;
	}
	@Override
	public int deleteNotice(SqlSession sqlSession, int noticeNo) {
		int result = sqlSession.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}
	@Override
	public int updateCount(SqlSession sqlSession, int noticeNo) {
		int result = sqlSession.update("NoticeMapper.updateCount", noticeNo);
		return result;
	}
	

}
