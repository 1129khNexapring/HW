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
	public Reservation selectOneByRes(SqlSession sqlSession, String tresMemId) {
		Reservation reservationOne = sqlSession.selectOne("ReservationMapper.selectOneByRes", tresMemId);
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

}
