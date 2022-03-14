package org.kh.hw.reservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.store.ResStore;
import org.springframework.stereotype.Repository;
@Repository 
public class ResStoreLogic implements ResStore {

	@Override
	public int insertReservation(SqlSession sqlSession, Res reservation) {
		int result = sqlSession.insert("ResMapper.insertRes", reservation);
		return result;
	}

	@Override
	public int insertReservationId(SqlSession sqlSession, Res reservation) {
		int result = sqlSession.insert("ResMapper.insertResId", reservation);
		return result;
	}

	@Override
	public Res selectViewReservation(SqlSession sqlSession, Res reservation) {
		Res reservationOne = sqlSession.selectOne("ResMapper.selectViewRes", reservation);
		return reservationOne;
	}

	@Override
	public Res selectOneByRes(SqlSession sqlSession, String memberId) {
		Res reservationOne = sqlSession.selectOne("ResMapper.selectOneByRes", memberId);
		return reservationOne;
	}

	@Override
	public int deleteReservation(SqlSession sqlSession, Res reservation) {
		int result = sqlSession.insert("ResMapper.deleteReservation", reservation);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("ResMapper.selectListCount");
		return totalCount;
	}

	@Override
	public List<Res> selectAll(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getResLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Res> rList = sqlSession.selectList("ResMapper.selectAllList", pi, rowBounds);
		return rList;
	}

	@Override
	public List<String> selectAllList(SqlSession sqlSession, String doctorId) {
		List<String> rList = sqlSession.selectList("ResMapper.selectResAll", doctorId);
		return rList;
	}

	@Override
	public Res selectOne(SqlSession sqlSession, String resNo) {
		Res reservationOne = sqlSession.selectOne("ResMapper.selectOne", resNo);
		return reservationOne;
	}

	@Override
	public int updateStatus(SqlSession sqlSession, String resNo) {
		int update = sqlSession.update("ResMapper.updateStatus", resNo);
		return update;
	}

	@Override
	public int removeStatus(SqlSession sqlSession, String resNo) {
		int update = sqlSession.update("ResMapper.deleteStatus", resNo);
		return update;
	}

}
