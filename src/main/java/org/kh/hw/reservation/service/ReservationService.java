package org.kh.hw.reservation.service;

import java.util.List;

import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Reservation;

public interface ReservationService {

	public int registerReservation(Reservation reservation);
	
	public int registerReservationId(Reservation reservation);
	
	public Reservation viewReservation(Reservation reservation);

	public int removeReservation(Reservation reservation);

	public Reservation printReservation(String tresMemId);

	public int getListCount();
	
	public List<Reservation> printAll(PageInfo pi);


	
}
