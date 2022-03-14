package org.kh.hw.reservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.store.ReservationStore;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationStoreLogic implements ReservationStore{

	@Override
	public int insertReservation(SqlSession sqlSession, Reservation reservation) {
		int result = sqlSession.insert("ReservationMapper.insertReservation", reservation);
		return result;
	}

	@Override
	public int insertReservationId(SqlSession sqlSession, Reservation reservation) {
		int result = sqlSession.insert("ReservationMapper.insertReservationId", reservation);
		return result;
	}
	
	@Override
	public Reservation selectViewReservation(SqlSession sqlSession, Reservation reservation) {
		Reservation reservationOne = sqlSession.selectOne("ReservationMapper.selectViewReservation", reservation);
		return reservationOne;
	}

	@Override
	public int deleteReservation(SqlSession sqlSession, Reservation reservation) {
		int result = sqlSession.insert("ReservationMapper.deleteReservation", reservation);
		return result;
	}

	@Override
	public Reservation selectOneByRes(SqlSession sqlSession, String memberId) {
		Reservation reservationOne = sqlSession.selectOne("ReservationMapper.selectOneByRes", memberId);
		return reservationOne;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("ReservationMapper.selectListCount");
		return totalCount;
	}
	
	@Override
	public List<Reservation> selectAll(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getResLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Reservation> rList = sqlSession.selectList("ReservationMapper.selectAllList", pi, rowBounds);
		return rList;
	}

	@Override
	public List<String> selectAllList(SqlSession sqlSession, String doctorId) {
		List<String> wList = sqlSession.selectList("ReservationMapper.selectReservationAll", doctorId);
		return wList;
	}

	@Override
	public Reservation selectOne(SqlSession sqlSession, String resNo) {
		Reservation reservationOne = sqlSession.selectOne("ReservationMapper.selectOne", resNo);
		return reservationOne;
	}

	@Override
	public int updateStatus(SqlSession sqlSession, String resNo) {
		int update = sqlSession.update("ReservationMapper.updateStatus", resNo);
		return update;
	}

	@Override
	public int removeStatus(SqlSession sqlSession, String resNo) {
		int update = sqlSession.update("ReservationMapper.deleteStatus", resNo);
		return update;
	}

}
