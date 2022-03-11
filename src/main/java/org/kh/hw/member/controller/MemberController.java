package org.kh.hw.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.hw.common.Pagination;
import org.kh.hw.member.domain.Member;
import org.kh.hw.member.service.MemberService;
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

//컨트롤러ㅇㅇㅇ
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private NoticeService nService;
	
	// 회원가입 페이지로 이동
	@RequestMapping(value="/member/JoinView.kh", method=RequestMethod.GET)
	public String memberJoinView() {
		return "member/memberJoin";
	}
	
	// 회원가입 실행
	@RequestMapping(value="/member/register.kh", method=RequestMethod.POST)
	public String memberRegister(Model model
			, @ModelAttribute Member member) throws UnsupportedEncodingException {
		try {
			int result = mService.registerMember(member);
			if(result > 0) {
				return "login";
			} else {
				model.addAttribute("msg", "회원가입 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 회원정보수정 페이지로 이동
	@RequestMapping(value="/member/myInfo.kh", method=RequestMethod.GET)
	public String memberMyInfo(HttpServletRequest request) {
		return "member/myPage";
	}
	
	// 회원정보수정 실행
	@RequestMapping(value="/member/modify.kh", method=RequestMethod.POST)
	public String memberModify(HttpServletRequest request
			,Model model
			, @ModelAttribute Member member) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		try {
			int result = mService.modifyMember(member);
			if(result > 0) {
				session.setAttribute("loginUser", member);
				return "member/myPage";
			}else{
				model.addAttribute("msg","회원 정보 수정 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴 페이지로 이동
	@RequestMapping(value = "/member/delete.kh", method = RequestMethod.GET)
	public String memberDelete(HttpServletRequest request) {
		return "member/memberDelete";
	}
	
	// 회원탈퇴 실행
	@RequestMapping(value = "/member/remove.kh", method = RequestMethod.POST)
	public String memberRemove(Model model
			, @RequestParam("memberId") String memberId
			, @RequestParam("memberPw") String memberPw
			, HttpServletRequest request
			, @RequestParam(value = "page", required = false) Integer page) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		HttpSession session = request.getSession();
		try {
			int result = mService.removeMember(member);
			if (result > 0) {
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
			} else {
				model.addAttribute("msg", "회원 탈퇴 실패");
				return "common/errorPage";
			}

		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPgae";
		}
	}
	
	// 일반 회원 아이디 찾기
	@RequestMapping(value ="/find_mem_form.kh", method=RequestMethod.GET)
	public String find_mem_id_form() {
		return "find_mem_form";
	}

	@RequestMapping(value= "/find_mem_id.kh", method=RequestMethod.POST)
	public String find_mem_id(HttpServletResponse response, @RequestParam("memberName")String memberName, @RequestParam("memberEmail")String memberEmail, Model model) throws Exception {
		Member member= new Member();
		member.setMemberName(memberName);
		member.setMemberEmail(memberEmail);
		try {
			List<Member>resultList = mService.find_id(response, member);
			if(!resultList.isEmpty()) {
				String mem = resultList.get(0).getMemberId().toString();
				model.addAttribute("id", mem);
				return "member/find_mem_id";
			}else{
				model.addAttribute("msg","일반 회원 아이디 찾기 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value= "/find_mem_pwd.kh", method=RequestMethod.POST)
	public String find_pwd(HttpServletResponse response, @RequestParam("memberId")String memberId, @RequestParam("memberPhone")String memberPhone, Model model) throws Exception {
		Member member= new Member();
		member.setMemberId(memberId);
		member.setMemberPhone(memberPhone);
		try {
			List<Member>resultList = mService.find_pwd(response, member);
			if(!resultList.isEmpty()) {
				String mem = resultList.get(0).getMemberPw().toString(); 
				model.addAttribute("pwd", mem);
				return "member/find_mem_pwd";
			}else{
				model.addAttribute("msg","일반 회원 비밀번호 찾기 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/member/checkDupId.kh", method=RequestMethod.GET)
	public String idDuplicateCheck(
			@RequestParam("memberId") String memberId) {
		int result = mService.checkIdDup(memberId);
		return String.valueOf(result);
	}
	
	@RequestMapping(value ="/mHistory.kh", method=RequestMethod.GET)
	public String mHistory() {
		return "member/mHistory";
	}
}
