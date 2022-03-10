package org.kh.hw.history.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.hw.common.Pagination;
import org.kh.hw.history.domain.History;
import org.kh.hw.history.service.HistoryService;
import org.kh.hw.notice.domain.Notice;
import org.kh.hw.notice.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;
import org.kh.hw.reservation.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HistoryController {

	@Autowired
	private HistoryService hService;

	// 수정
	@RequestMapping(value = "/history/modify.kh", method = RequestMethod.POST)
	public String historyModify(
			Model model
			, @ModelAttribute History history) {	
		try {
			int result = hService.modifyHistory(history);
			if (result > 0) {
				return "redirect:/history/detail.kh?resNo="+history.getResNo();
			} else {
				model.addAttribute("msg", "수정 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

	// 리스트 볼 수 있음
	@RequestMapping(value = "/historyList.kh", method = RequestMethod.GET)
	public String historyShowList(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		// 비즈니스 로직 -> DB에서 전체 게시물 갯수 가져옴
		int totalCount = hService.getListCount();
//		int totalCount = 10;
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		// 비즈니스 로직 -> DB에서 데이터를 가져와야 함
		List<History> hList = hService.printAll(pi);
		if (!hList.isEmpty()) {
			model.addAttribute("hList", hList);
			model.addAttribute("pi", pi);
			return "history/list";
		} else {
			model.addAttribute("msg", "진료 이력 조회 실패");
			return "common/errorPage";
		}
	}

	// 상세 보기
	@RequestMapping(value = "/history/detail.kh", method = RequestMethod.GET)
	public String historyHistoryView(Model model, @RequestParam("resNo") String resNo) {
		// 비즈니스 로직
		History history = hService.printOneByNo(resNo);
		if (history != null) {
			model.addAttribute("history", history);
			return "history/historyHis";
		} else {
			model.addAttribute("msg", "등록 실패");
			return "common/errorPage";
		}
	}

	// 등록 뷰
	@RequestMapping(value = "historyGo.kh", method = RequestMethod.GET)
	public String historyHistoryGo() {
		return "history/history";
	}

	// 등록
	@RequestMapping(value = "/history.kh", method = RequestMethod.POST)
	public String historyRegister(Model model, @ModelAttribute History history, @ModelAttribute Res res,
			HttpServletRequest request) throws UnsupportedEncodingException {
		try {
			int result = hService.registerHistory(history);
			HttpSession session = request.getSession();
			if (result > 0) {
				session.setAttribute("his", history);
				return "redirect:/historyList.kh";
			} else {
				model.addAttribute("msg", "저장 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
}