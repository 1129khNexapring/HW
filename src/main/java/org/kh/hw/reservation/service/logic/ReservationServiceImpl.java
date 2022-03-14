package org.kh.hw.reservation.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.service.ReservationService;
import org.kh.hw.reservation.store.ReservationStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationStore rStore;
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int registerReservation(Reservation reservation) {
		int result = rStore.insertReservation(sqlSession, reservation);
		return result;
	}
	
	@Override
	public int registerReservationId(Reservation reservation) {
		int result = rStore.insertReservationId(sqlSession, reservation);
		return result;
	}

	@Override
	public Reservation viewReservation(Reservation reservation) {
		Reservation reservationOne = rStore.selectViewReservation(sqlSession, reservation);
		return reservationOne;
	}


	@Override
	public int removeReservation(Reservation reservation) {
		int result = rStore.deleteReservation(sqlSession, reservation);
		return result;
	}

	@Override
	public Reservation printReservation(String memberId) {
		Reservation reservationOne = rStore.selectOneByRes(sqlSession, memberId);
		return reservationOne;
	}
	
	@Override
	public int getListCount() {
		int totalCount = rStore.selectListCount(sqlSession);
		return totalCount;
	}
	
	@Override
	public List<Reservation> printAll(PageInfo pi) {
		List<Reservation> rList = rStore.selectAll(sqlSession, pi);
		return rList;
	}

	@Override
	public List<String> printResAll(String doctorId) {
		List<String> wList = rStore.selectAllList(sqlSession, doctorId);
		return wList;
	}

	@Override
	public Reservation printResNo(String resNo) {
		Reservation reservationOne = rStore.selectOne(sqlSession, resNo);
		return reservationOne;
	}

	@Override
	public int modifyStatus(String resNo) {
		int update = rStore.updateStatus(sqlSession, resNo);
		return update;
	}

	@Override
	public int removeStatus(String resNo) {
		int update = rStore.removeStatus(sqlSession, resNo);
		return update;
	}

}
