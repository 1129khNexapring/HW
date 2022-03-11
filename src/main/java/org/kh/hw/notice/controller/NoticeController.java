package org.kh.hw.notice.controller;

import java.util.List;

import org.kh.hw.common.Pagination;
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

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;

	
	//공지사항 전체목록
	@RequestMapping(value = "/notice/list.kh", method = RequestMethod.GET)
	public String noticeListView(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		// 비즈니스 로직 -> DB에서 전체 게시물 갯수 가져옴
		int totalCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		// 비즈니스 로직 -> DB에서 데이터를 가져와야 함
		List<Notice> nList = nService.printAll(pi);
		if (!nList.isEmpty()) {
			model.addAttribute("nList", nList);
			model.addAttribute("pi", pi);
			return "notice/noticeListView";
		} else {
			model.addAttribute("msg", "공지사항 조회 실패");
			return "common/errorPage";
		}
	}

	//관리자 공지사항 전체목록
	@RequestMapping(value = "/notice/adlist.kh", method = RequestMethod.GET)
	public String noticeAdListView(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		// 비즈니스 로직 -> DB에서 전체 게시물 갯수 가져옴
		int totalCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		// 비즈니스 로직 -> DB에서 데이터를 가져와야 함
		List<Notice> nList = nService.printAll(pi);
		if (!nList.isEmpty()) {
			model.addAttribute("nList", nList);
			model.addAttribute("pi", pi);
			return "notice/noticeAdminListView";
		} else {
			model.addAttribute("msg", "공지사항 조회 실패");
			return "common/errorPage";
		}
	}

	//  공지사항 상세보기
	@RequestMapping(value = "/notice/detail.kh", method = RequestMethod.GET)
	public String noticeDetailView(Model model, @RequestParam("noticeNo") Integer noticeNo) {
		// 조회수 증가 - 비즈니스 로직
		 nService.updateCount(noticeNo);
		// 비즈니스 로직
		Notice notice = nService.printOneByNo(noticeNo);
		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		} else {
			model.addAttribute("msg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자페이지 공지사항 상세보기
	@RequestMapping(value = "/notice/addetail.kh", method = RequestMethod.GET)
	public String noticeAdminDetailView(Model model, @RequestParam("noticeNo") Integer noticeNo) {
		

		// 비즈니스 로직
		Notice notice = nService.printOneByNo(noticeNo);
		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeAdminDetailView";
		} else {
			model.addAttribute("msg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}

	//관리자 공지사항 작성
	@RequestMapping(value = "/notice/writeView.kh", method = RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeWriteForm";
	}

	@RequestMapping(value = "/notice/register.kh", method = RequestMethod.POST)
	public String noticeRegister(Model model, @ModelAttribute Notice notice) {

		int result = nService.registerNotice(notice);
		if (result > 0) {
			return "redirect:/notice/adlist.kh";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			return "common/errorPage";
		}
	}

	//관리자 공지사항 수정
	@RequestMapping(value = "/notice/updateView.kh", method = RequestMethod.GET)
	public String noticeUpdateView(Model model, @RequestParam("noticeNo") Integer noticeNo) {

		Notice notice = nService.printOneByNo(noticeNo);
		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeUpdateForm";
		} else {
			model.addAttribute("msg", "게시글 조회 실패");
			return "common/errorPage";
		}

	}

	//관리자 공지사항 수정
	@RequestMapping(value = "/notice/modify.kh", method = RequestMethod.POST)
	public String noticeModify(@RequestParam("noticeNo") Integer noticeNo, Model model, @ModelAttribute Notice notice) {

		try {
			int result = nService.modifyNotice(notice);
			if (result > 0) {
				model.addAttribute("noticeNo", notice);
				return "redirect:/notice/adlist.kh";
			} else {
				model.addAttribute("msg", "공지사항 수정 실패!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}

//	
//	@RequestMapping(value="/notice/removeView.kh", method=RequestMethod.GET)
//	public String noticeRemoveView() {
//		return "notice/noticeAdminListView";
//	}
//	

	//관리자 공지사항 삭제
	@RequestMapping(value = "/notice/delete.kh", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam("noticeNo") int noticeNo, Model model) {

		try {
			int result = nService.deleteNotice(noticeNo);
			if (result > 0) {
				model.addAttribute("notice", noticeNo);
				return "redirect:/notice/adlist.kh";
			} else {
				model.addAttribute("msg", "공지사항 수정 실패!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}

}











