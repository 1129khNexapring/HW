package org.kh.hw.reservation.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.member.domain.Member;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.service.ResService;
import org.kh.hw.reservation.store.ResStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ResServiceImpl implements ResService {

	@Autowired
	private ResStore rStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerRes(Res reservation) {
		int result = rStore.insertReservation(sqlSession, reservation);
		return result;
	}
	@Override
	public int registerResId(Res reservation) {
		int result = rStore.insertReservationId(sqlSession, reservation);
		return result;
	}
	@Override
	public Res viewRes(Res reservation) {
		Res reservationOne = rStore.selectViewReservation(sqlSession, reservation);
		return reservationOne;
	}
	@Override
	public Res printRes(String memberId) {
		Res reservationOne = rStore.selectOneByRes(sqlSession, memberId);
		return reservationOne;
	}
	@Override
	public int removeRes(Res reservation) {
		int result = rStore.deleteReservation(sqlSession, reservation);
		return result;
	}
	@Override
	public int getListCount() {
		int totalCount = rStore.selectListCount(sqlSession);
		return totalCount;
	}
	@Override
	public List<Res> printAll(PageInfo pi) {
		List<Res> rList = rStore.selectAll(sqlSession, pi);
		return rList;
	}
	@Override
	public List<String> printResAll(String doctorId) {
		List<String> rList = rStore.selectAllList(sqlSession, doctorId);
		return rList;
	}
	@Override
	public Res printResNo(String resNo) {
		Res reservationOne = rStore.selectOne(sqlSession, resNo);
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
