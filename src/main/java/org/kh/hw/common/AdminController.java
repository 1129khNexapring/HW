package org.kh.hw.common;

import java.util.List;

import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	
	@Autowired
	private ReservationService rService;
	
	// 관리자 페이지
	@RequestMapping(value="/admin/adminPage.kh", method=RequestMethod.GET)
	public String adminPage(Model model
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
}
