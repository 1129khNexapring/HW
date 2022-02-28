package org.kh.hw.reservation.service;

import java.util.List;

import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;

public interface ResService {
	
	public int registerRes(Res reservation); // 회원 일반 예약
	public int registerResId(Res reservation); // 비회원 일반 예약
	public Res viewRes(Res reservation); // 비회원 일반 예약 조회
	public Res printRes(String resMemId); // 회원 일반 예약 조회
	public int removeRes(Res reservation); // 일반 예약 취소
	public int getListCount();
	public List<Res> printAll(PageInfo pi);

}
