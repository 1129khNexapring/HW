package org.kh.hw.reservation.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.kh.hw.doctor.domain.Doctor;
import org.kh.hw.doctor.service.DoctorService;
import org.kh.hw.member.domain.Member;
import org.kh.hw.member.service.MemberService;
import org.kh.hw.reservation.domain.Reservation;
import org.kh.hw.reservation.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	@Autowired
	private DoctorService dService;
	
	// 동행서비스 예약 페이지로 이동
	@RequestMapping(value="/reservation/JoinView.kh", method=RequestMethod.GET)
	public String reservationJoinView(Model model
			, @ModelAttribute Reservation reservation) throws UnsupportedEncodingException {
		// 진료과 정보 가져오기
		List<String> sList = dService.printAllDpt();
		if (!sList.isEmpty()) {
			model.addAttribute("sList", sList);
			return "reservation/withReservation";	
		} else {
			model.addAttribute("msg", "진료과 조회 실패");
			return "common/errorPage";
		}
	}
	
	// 진료과 선택 시 의사 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/reservation/JoinViewDoctor.kh", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String resJoinViewDoctor(Model model
			, @RequestParam("doctorDpt") String doctorDpt) throws UnsupportedEncodingException {
		List<Doctor> dList = dService.printAll(doctorDpt);
		if(!dList.isEmpty()) {
			return new Gson().toJson(dList);
		}
		return null;
	}
	
	// 동행서비스 예약 등록 실행(비회원)
	@RequestMapping(value="/reservation/register.kh", method=RequestMethod.POST)
	public String reservationRegister(
			Model model
			, @ModelAttribute Reservation reservation
			, @ModelAttribute Member member
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request) throws UnsupportedEncodingException{
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(uploadFile, request);//실제 파일저장
				if(renameFileName != null) {
					reservation.setFileName(uploadFile.getOriginalFilename());
					reservation.setFileRename(renameFileName);
				}
			}
			int result = rService.registerReservation(reservation);
			if(result > 0) {
				return "reservation/type";
			}else {
				model.addAttribute("msg","동행서비스예약 등록 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 동행서비스 예약 등록 실행(회원)
	@RequestMapping(value="/reservationId/register.kh", method=RequestMethod.POST)
	public String reservationRegisterId(
			Model model
			, @ModelAttribute Reservation reservation
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request) throws UnsupportedEncodingException{	
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(uploadFile, request);//실제 파일저장
				if(renameFileName != null) {
					reservation.setFileName(uploadFile.getOriginalFilename());
					reservation.setFileRename(renameFileName);
				}
			}
			int result = rService.registerReservationId(reservation);
			if(result > 0) {
				HttpSession session = request.getSession();
				String memberId = ((Member)(session.getAttribute("loginUser"))).getMemberId(); // 세션에 저장된 아이디 값
				Reservation reservationOne = rService.printReservation(memberId);
				if(reservationOne != null) {
					model.addAttribute("reservation", reservationOne);
					return "reservation/withReservationViewId";
				} else {
					model.addAttribute("msg", "동행서비스 예약 조회 실패");
					return "common/errorPage";
				}
			}else {
				model.addAttribute("msg","동행서비스 예약 등록 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 파일 경로
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession()
				.getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		// 폴더 선택
		File folder = new File(savePath);
		// 폴더 없으면 자동 생성
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String filePath = folder + "\\" + renameFileName;
		// 파일 저장
		try {
			uploadFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 파일명 리턴
		return renameFileName;
	}
	
	// 비회원 정보 입력 페이지
		@RequestMapping(value="/withReservationInput.kh", method=RequestMethod.GET)
		public String withReservationView() {
			return "reservation/withReservationInput";
		}
		
	// 비회원 정보 전달
	@RequestMapping(value="/reservation/view.kh", method=RequestMethod.POST)
	public String reservationLogin(Model model, HttpServletRequest request) {
		String resName = request.getParameter("resName");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		Reservation reservation = new Reservation();
		reservation.setResName(resName);
		reservation.setPhone(phone);
		reservation.setBirth(birth);
		try {
			Reservation loginNoUser = rService.viewReservation(reservation);
			if(loginNoUser != null) {
				model.addAttribute("loginNoUser", loginNoUser);
				return "reservation/withReservationView";
			}else {
				request.setAttribute("msg", "동행서비스 예약 조회 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 동행서비스 예약 조회(회원)
	@RequestMapping(value="/withReservationView.kh", method=RequestMethod.GET)
	public String reservationView(Model model
			, HttpServletRequest request
			, @ModelAttribute Reservation reservation) throws UnsupportedEncodingException {
		try {
			HttpSession session = request.getSession();
			String memberId = ((Member)(session.getAttribute("loginUser"))).getMemberId(); // 세션에 저장된 아이디 값
			Reservation reservationOne = rService.printReservation(memberId);
			if(reservationOne != null) {
				model.addAttribute("reservation", reservationOne);
				return "reservation/withReservationViewId";
			} else {
				model.addAttribute("msg", "동행서비스 예약 조회 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			return "login";
		}
	}
	
	// 동행서비스예약 취소 실행
	@RequestMapping(value= "/reservation/remove.kh", method = RequestMethod.GET)
	public String reservtaionRemove(Model model
			, @RequestParam("resName") String resName
			, @RequestParam("phone") String phone
			, @RequestParam("birth") String birth) {
		Reservation reservation = new Reservation();
		reservation.setResName(resName);
		reservation.setPhone(phone);
		reservation.setBirth(birth);
		try {
			int result = rService.removeReservation(reservation);
			if (result > 0) {
				return "reservation/withReservation";
			}else {
				model.addAttribute("msg", "동행서비스 예약 취소 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

}
