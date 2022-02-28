package org.kh.hw.reservation.controller;



import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.hw.common.Pagination;
import org.kh.hw.member.domain.Member;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.service.NoticeService;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.service.ResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ResController {

	@Autowired
	private ResService rService;
	@Autowired
	private NoticeService nService;
	
	// 일반 예약 페이지로 이동
	@RequestMapping(value = "/res/JoinView.kh", method=RequestMethod.GET)
	public String resJoinView(HttpServletRequest request
			, @ModelAttribute Res reservation) throws UnsupportedEncodingException {
		return "res/reservation";
	}
	
	// 일반 예약 등록 실행(비회원)
	@RequestMapping(value = "/res/register.kh", method=RequestMethod.POST)
	public String resRegister(
			Model model
			, @ModelAttribute Res reservation
			, @ModelAttribute Member member
			, HttpServletRequest request) {
		try {
			int result = rService.registerRes(reservation);
			if(result > 0) {
				return "res/type";
			}else {
				model.addAttribute("msg", "일반예약 등록 실패");
				return "common/erroPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 일반 예약 등록 실행(회원)
	@RequestMapping(value="/resId/register.kh", method=RequestMethod.POST)
	public String registerNomemReserv(Model model
			, @ModelAttribute Res reservation
			, @ModelAttribute Member member
			, HttpServletRequest request) throws UnsupportedEncodingException{
		int result = rService.registerResId(reservation);
		if(result > 0) {
			HttpSession session = request.getSession();
			String resMemId = ((Member)(session.getAttribute("loginUser"))).getMemberId();
			Res reservationOne =  rService.printRes(resMemId);
			if(reservationOne != null) {
				model.addAttribute("reservation", reservationOne);
			return "res/reservationViewId";
			}else {
				model.addAttribute("msg", "일반 예약 조회 실패");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("msg", "일반 예약 등록 실패");
			return "common/erroPage";
		}
	}
	
	// 비회원 정보 입력 페이지
	@RequestMapping(value="/reservationInput.kh", method=RequestMethod.GET)
	public String ReservationView() {
		return "res/reservationInput";
	}
			
	// 비회원 정보 전달
	@RequestMapping(value="/res/view.kh", method=RequestMethod.POST)
	public String reservationLogin(Model model, HttpServletRequest request) {
		String resName = request.getParameter("resName");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		Res reservation = new Res();
		reservation.setResName(resName);
		reservation.setPhone(phone);
		reservation.setBirth(birth);
		try {
			Res loginNoUser = rService.viewRes(reservation);
			if(loginNoUser != null) {
				model.addAttribute("loginNoUser", loginNoUser);
				return "res/reservationView";
			}else {
				request.setAttribute("msg", "일반 예약 조회 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 일반 예약 조회(회원)
	@RequestMapping(value="/reservationView.kh", method=RequestMethod.GET)
	public String reservNormalMemView(Model model,
			  @ModelAttribute Res reservation, HttpServletRequest request) throws UnsupportedEncodingException {
		try {
			HttpSession session = request.getSession();
			String resMemId = ((Member)(session.getAttribute("loginUser"))).getMemberId();
			Res reservationOne =  rService.printRes(resMemId);
			if(reservationOne != null) {
				model.addAttribute("reservation", reservationOne);
				return "res/reservationViewId";	
			}else {
				model.addAttribute("msg", "일반 예약 조회 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			return "login";
		}
	}
	
	// 일반 예약 취소 실행
	@RequestMapping(value= "/res/remove.kh", method = RequestMethod.GET)
	public String reservationRemove(Model model
			, @RequestParam("resName") String resName
			, @RequestParam("phone") String phone
			, @RequestParam("birth") String birth) {
		Res reservation = new Res();
		reservation.setResName(resName);
		reservation.setPhone(phone);
		reservation.setBirth(birth);
		try {
			int result = rService.removeRes(reservation);
			if (result > 0) {
				return "res/reservation";
			}else {
				model.addAttribute("msg", "일반 예약 취소 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
}
