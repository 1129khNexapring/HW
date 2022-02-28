package org.kh.hw.reservation.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Reservation;

public interface ReservationStore {

	public int insertReservation(SqlSession sqlSession, Reservation reservation);
	
	public int insertReservationId(SqlSession sqlSession, Reservation reservation);
	
	public Reservation selectViewReservation(SqlSession sqlSession, Reservation reservation);

	public int deleteReservation(SqlSession sqlSession, Reservation reservation);

	public Reservation selectOneByRes(SqlSession sqlSession, String tresMemId);

	public int selectListCount(SqlSession sqlSession);
	
	public List<Reservation> selectAll(SqlSession sqlSession, PageInfo pi);

}
