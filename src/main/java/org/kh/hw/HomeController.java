package org.kh.hw;

import java.util.List;

import org.kh.hw.common.Pagination;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
		
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private NoticeService nService;
	
	// 메인 페이지
	@RequestMapping(value="/main.kh", method=RequestMethod.GET)
	public String mainView(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Notice> nmList = nService.printAll(pi);
		if (!nmList.isEmpty()) {
			model.addAttribute("nmList", nmList);
			model.addAttribute("pi", pi);
			return "main";
		} else {
			return "main";
		}
	}
	
	// 회원가입 선택 페이지
	@RequestMapping(value="/join.kh", method=RequestMethod.GET)
	public String joinView() {
		return "join";
	}
	
	// 아이디/비밀번호 찾기 선택 페이지
	@RequestMapping(value="/idpw.kh", method=RequestMethod.GET)
	public String idpwView() {
		return "idpw";
	}
	
	// 진료 예약
	@RequestMapping(value="/res.kh", method=RequestMethod.GET)
	public String resView() {
		return "res";
	}
		
		// 일반 예약 확인 선택
		@RequestMapping(value="/res/type.kh", method=RequestMethod.GET)
		public String resTypeView() {
			return "res/type";
		}
		
		// 일반 예약 확인 선택
		@RequestMapping(value="/reservation/type.kh", method=RequestMethod.GET)
		public String reservationTypeView() {
			return "reservation/type";
		}
	
	// 진료 안내
	@RequestMapping(value="/medical.kh", method=RequestMethod.GET)
	public String medicalView() {
		return "medical/type";
	}
	
		// 진료과
		@RequestMapping(value="/type.kh", method=RequestMethod.GET)
		public String typeView() {
			return "medical/type";
		}
		
		// 의료진
		@RequestMapping(value="/doctor.kh", method=RequestMethod.GET)
		public String doctorView() {
			return "medical/doctor";
		}
	
	// 병원 안내
	@RequestMapping(value="/hospital.kh", method=RequestMethod.GET)
	public String hospitalView() {
		return "hospital/Director";
	}
	
		// 대표원장
		@RequestMapping(value="/director.kh", method=RequestMethod.GET)
		public String directorView() {
			return "hospital/Director";
		}
		
		// 찾아오시는 길
		@RequestMapping(value="/route.kh", method=RequestMethod.GET)
		public String routeView() {
			return "hospital/route";
		}
}
