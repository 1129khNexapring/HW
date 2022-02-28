package org.kh.hw.doctor.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.hw.common.Pagination;
import org.kh.hw.doctor.domain.Doctor;
import org.kh.hw.doctor.service.DoctorService;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DoctorController {
	
	@Autowired
	private DoctorService dService;
	@Autowired
	private NoticeService nService;

	// 회원가입 페이지로 이동
	@RequestMapping(value="/doctor/JoinView.kh", method=RequestMethod.GET)
	public String doctorJoinView() {
		return "doctor/doctorJoin";
	}
	
	// 회원가입 실행
	@RequestMapping(value="/doctor/register.kh", method=RequestMethod.POST)
	public String docotrRegister(Model model
			, @ModelAttribute Doctor doctor) throws UnsupportedEncodingException  {
		try {
			int result = dService.registerDoctor(doctor);
			if(result > 0) {
				return "login";
			}else {
				model.addAttribute("msg", "회원가입 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	
	// 회원정보수정 페이지로 이동
	@RequestMapping(value="/doctor/myInfo.kh", method=RequestMethod.GET)
	public String doctorMyInfo(HttpServletRequest request) {
		return "doctor/doctorMyPage";
	}
	
	// 회원정보수정 실행
	@RequestMapping(value="/doctor/modify.kh", method=RequestMethod.POST)
	public String doctorModify (HttpServletRequest request
			,Model model
			, @ModelAttribute Doctor doctor) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		try {
			int result = dService.modifyDoctor(doctor);
			if(result > 0) {
				session.setAttribute("loginDt", doctor);
				return "doctor/doctorMyPage";
			}else {
				model.addAttribute("msg", "회원 정보 수정 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴 페이지로 이동
	@RequestMapping(value = "/doctor/delete.kh", method = RequestMethod.GET)
	public  String docotorDelete(HttpServletRequest request) {
		return "doctor/doctorDelete";
	}
	
	// 회원탈퇴 실행
	@RequestMapping(value = "/doctor/remove.kh", method = RequestMethod.POST)
	public String doctorRemove(Model model
			, @RequestParam("doctorId") String doctorId
			, @RequestParam("doctorPw") String doctorPw
			, HttpServletRequest request
			, @RequestParam(value = "page", required = false) Integer page) {
		Doctor doctor = new Doctor();
		doctor.setDoctorId(doctorId);
		doctor.setDoctorPw(doctorPw);
		HttpSession session = request.getSession();
		try {
			int result = dService.removeDoctor(doctor);
			if(result > 0) {
				session.invalidate();
			int currentPage = (page != null) ? page : 1;
			int totalCount = nService.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<Notice> nmList = nService.printAll(pi);
			if (!nmList.isEmpty()) {
				model.addAttribute("nmList", nmList);
				model.addAttribute("pi", pi);
			}	
				return "main";
			}else {
				model.addAttribute("msg","회원 탈퇴 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	// 의사 아이디/비밀번호 찾기
	@RequestMapping(value ="/find_doc_form.kh", method=RequestMethod.GET)
	public String find_doc_id_form() {
		return "find_doc_form";
	}
	
	@RequestMapping(value= "/find_doc_id.kh", method=RequestMethod.POST)
	public String find_doctor_id(HttpServletResponse response, @RequestParam("doctorName")String doctorName, @RequestParam("doctorEmail")String doctorEmail, Model model) throws Exception {
		Doctor doctor= new Doctor();
		doctor.setDoctorName(doctorName);
		doctor.setDoctorEmail(doctorEmail);
		try {
			List<Doctor>resultList = dService.find_doc_id(response, doctor);
			if(!resultList.isEmpty()) {
				String doc = resultList.get(0).getDoctorId().toString(); 
				model.addAttribute("id", doc);
				return "doctor/find_doc_id";
			}else{
				model.addAttribute("msg","의사 아이디 찾기 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
		
		@RequestMapping(value= "/find_doc_pwd.kh", method=RequestMethod.POST)
		public String find_doctor_pwd(HttpServletResponse response, @RequestParam("doctorId")String doctorId, @RequestParam("doctorPhone")String doctorPhone, Model model) throws Exception {
			Doctor doctor= new Doctor();
			doctor.setDoctorId(doctorId);
			doctor.setDoctorPhone(doctorPhone);
			try {
			List<Doctor>resultList = dService.find_doc_pwd(response, doctor);
			if(!resultList.isEmpty()) {
				String doc = resultList.get(0).getDoctorPw().toString(); 
				model.addAttribute("pwd", doc);
				return "doctor/find_doc_pwd";
			}else{
				model.addAttribute("msg","의사 비밀번호 찾기 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
		
	@ResponseBody
	@RequestMapping(value="/doctor/checkDupId.kh", method=RequestMethod.GET)
	public String idDuplicateCheck(
			@RequestParam("doctorId") String doctorId) {
		int result = dService.checkIdDup(doctorId);
		return String.valueOf(result);
	}
}