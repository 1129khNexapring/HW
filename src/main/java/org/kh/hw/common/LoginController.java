package org.kh.hw.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.hw.doctor.domain.Doctor;
import org.kh.hw.doctor.service.DoctorService;
import org.kh.hw.member.domain.Member;
import org.kh.hw.member.service.MemberService;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@Autowired
	private MemberService mService;
	@Autowired
	private DoctorService dService;
	@Autowired
	private NoticeService nService;
		// 로그인 페이지
		@RequestMapping(value="/login.kh", method=RequestMethod.GET)
		public String loginView() {
			return "login";
		}
		
		// 유형에 따른 로그인
		@RequestMapping(value="/loginType.kh", method=RequestMethod.POST)
		public String loginType(Model model, HttpServletRequest request
				, @RequestParam("id") String id
				, @RequestParam("pw") String pw
				, @RequestParam(value = "type", required = false) String type
				, @RequestParam(value = "page", required = false) Integer page) {
			// 일반 회원
			if(type.equals("member")) {
				Member member = new Member();
				member.setMemberId(id);
				member.setMemberPw(pw);
				try {
					Member loginUser = mService.loginMember(member);
					if(loginUser != null) {
						HttpSession session = request.getSession();
						session.setAttribute("loginUser", loginUser);
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
						request.setAttribute("msg", "일반 회원 로그인 실패");
						return "common/errorPage";
					}
				}catch(Exception e) {
					request.setAttribute("msg", e.toString());
					return "common/errorPage";
				}
			// 의사
			} else if(type.equals("doctor")) {
				Doctor doctor = new Doctor();
				doctor.setDoctorId(id);
				doctor.setDoctorPw(pw);
				try {
					Doctor loginDt = dService.loginDoctor(doctor);
					if(loginDt != null) {
						HttpSession session = request.getSession();
						session.setAttribute("loginDt", loginDt);
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
						request.setAttribute("msg", "의사 로그인 실패");
						return "common/errorPage";
					}
				}catch(Exception e) {
					request.setAttribute("msg", e.toString());
					return "common/errorPage";
				}
			// 관리자
			}
			return null;
		}
		// 로그인 페이지
		@RequestMapping(value="/admin.kh", method=RequestMethod.GET)
		public String adminLoginView() {
			return "adminLogin";
		}
		
		// 관리자 로그인
		@RequestMapping(value="/adminLogin.kh", method=RequestMethod.POST)
		public String adminLogin(Model model, HttpServletRequest request
				, @RequestParam("id") String id
				, @RequestParam("pw") String pw
				, @RequestParam(value = "type", required = false) String type
				, @RequestParam(value = "page", required = false) Integer page) {
			if(id.equals("admin") && pw.equals("admin")) {
				Member member = new Member();
				member.setMemberId(id);
				member.setMemberPw(pw);
				try {
					Member loginAdmin = mService.loginMember(member);
					if(loginAdmin != null) {
						HttpSession session = request.getSession();
						session.setAttribute("loginAdmin", loginAdmin);
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
						request.setAttribute("msg", "관리자 로그인 실패");
						return "common/errorPage";
					}
				}catch(Exception e) {
					request.setAttribute("msg", e.toString());
					return "common/errorPage";
				}
			}
			return null;
		}
		
		// 로그아웃
		@RequestMapping(value="/logout.kh", method=RequestMethod.GET)
		public String memberLogout(Model model, HttpServletRequest request
				, @RequestParam(value = "page", required = false) Integer page) {
			HttpSession session = request.getSession();
			if(session != null) {
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
				request.setAttribute("msg", "로그아웃 실패");
				return "common/errorPage";
			}
		}
}
