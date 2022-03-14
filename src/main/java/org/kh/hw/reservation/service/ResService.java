package org.kh.hw.reservation.service;

import java.util.List;

import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.domain.Reservation;

public interface ResService {
	
	public int registerRes(Res reservation); // 비회원 일반 예약
	public int registerResId(Res reservation); // 회원 일반 예약
	public Res viewRes(Res reservation); // 비회원 일반 예약 조회
	public Res printRes(String memberId); // 회원 일반 예약 조회
	public int removeRes(Res reservation); // 일반 예약 취소
	public int getListCount();
	public List<Res> printAll(PageInfo pi);
	public List<String> printResAll(String doctorId); // 의사 진료 이력 일반 예약 불러오기
	public Res printResNo(String resNo);
	public int modifyStatus(String resNo); // 예약 상태 업데이트
	public int removeStatus(String resNo); // 예약 상태 되돌리기
}
