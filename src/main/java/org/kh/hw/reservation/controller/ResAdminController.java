package org.kh.hw.reservation.controller;

import java.util.List;

import org.kh.hw.common.WithResPagination;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.service.ResService;
import org.kh.hw.reservation.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ResAdminController {
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private ResService rService2;
	
	// 동행서비스 예약 관리
	@RequestMapping(value="/admin/withResList.kh", method=RequestMethod.GET)
	public String withResListView(Model model
			, @RequestParam(value="page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService.getListCount();
		PageInfo pi = WithResPagination.getPageInfo(currentPage, totalCount);
		List<Reservation> rList = rService.printAll(pi);
		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("pi", pi);
			return "admin/withReservation";
		}else {
			model.addAttribute("msg", "예약 전체 조회 실패");
			return "common/errorPage";
		}
	}
	
	// 일반 예약 관리
	@RequestMapping(value="/admin/resList.kh", method=RequestMethod.GET)
	public String resListView(Model model
			, @RequestParam(value="page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService2.getListCount();
		PageInfo pi = WithResPagination.getPageInfo(currentPage, totalCount);
		List<Res> rList = rService2.printAll(pi);
		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("pi", pi);
			return "admin/reservation";
		}else {
			model.addAttribute("msg", "예약 전체 조회 실패");
			return "common/errorPage";
		}
	}
}
