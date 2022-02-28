package org.kh.hw.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.hw.common.QnaPagenation;
import org.kh.hw.member.domain.Member;
import org.kh.hw.qna.domain.PageInfo;
import org.kh.hw.qna.domain.Qna;
import org.kh.hw.qna.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QnaController {
   
   @Autowired
   private QnaService qService;
   @RequestMapping(value="/qna/list.kh", method=RequestMethod.GET)
   public String qnaListView(
         Model model
         , @RequestParam(value="page", required=false) Integer page) {
      int currentPage = (page != null) ? page : 1;
      // 비즈니스 로직 -> DB에서 전체 게시물 갯수 가져옴
      int totalCount = qService.getListCount();
      PageInfo pi = QnaPagenation.getPageInfo(currentPage, totalCount);
      // 비즈니스 로직 -> DB에서 데이터를 가져와야 함
      List<Qna> qList = qService.printAll(pi);
      model.addAttribute("qList", qList);
      model.addAttribute("pi", pi);
      return "qna/qnaListView";
   }

   @RequestMapping(value="/qna/detail.kh", method=RequestMethod.GET)
   public String qnaDetailView(
         Model model
         , @RequestParam("qnaNo") Integer qnaNo) {
      // 조회수 증가 - 비즈니스 로직
      qService.updateCount(qnaNo);
      // 비즈니스 로직
      Qna qna = qService.printOneByNo(qnaNo);
      if(qna != null) {
         model.addAttribute("qna", qna);
         return "qna/qnaDetailView";
      }else {
         model.addAttribute("msg", "게시글 조회 실패");
         return "common/errorPage";
      }
   }

   @RequestMapping(value="/qna/writeView.kh", method=RequestMethod.GET)
   public String qnaWriteView() {
      return "qna/qnaWriteForm";
   }
   
   @RequestMapping(value="/qna/register.kh", method=RequestMethod.POST)
   public String qnaRegister(
         Model model
         , @ModelAttribute Qna qna
         , HttpServletRequest request) {
      try {
         int result = qService.registerQna(qna);
         if(result > 0) {
            return "redirect:/qna/list.kh";
         }else {
            model.addAttribute("msg", "게시글 등록 실패!");
            return "common/errorPage";
         }
      }catch(Exception e) {
         model.addAttribute("msg", e.toString());
         return "common/errorPage";
      }
   }
   
   //게시글 삭제
   @RequestMapping(value="/qna/remove.kh", method=RequestMethod.GET)
   public String qnaRemove(
         Model model
         , @RequestParam("qnaNo") int qnaNo) {
      try {
         int result = qService.removeQna(qnaNo);
         if(result > 0) {
            
            return "redirect:/qna/list.kh";
         }else {
            model.addAttribute("msg", "게시글 삭제 실패");
            return "common/errorPage";
         }
      }catch(Exception e) {
         model.addAttribute("msg", e.toString());
         return "common/errorPage";
      }
   }
   
   
   @RequestMapping(value = "/qna/update.kh", method = RequestMethod.GET)
      public String qnaUpdateView(Model model, @RequestParam("qnaNo") Integer qnaNo) {

         Qna qna = qService.printOneByNo(qnaNo);
         if (qna != null) {
            model.addAttribute("qna", qna);
            return "qna/qnaUpdateForm";
         } else {
            model.addAttribute("msg", "게시글 조회 실패");
            return "common/errorPage";
         }
      }
   	// 게시글 수정
      @RequestMapping(value = "/qna/modify.kh", method = RequestMethod.POST)
      public String qnaModify(@RequestParam("qnaNo") Integer qnaNo, Model model, @ModelAttribute Qna qna) {

         try {
            int result = qService.modifyQna(qna);
            if (result > 0) {
               return "redirect:/qna/list.kh";
            } else {
               model.addAttribute("msg", "게시글 수정 실패");
               return "common/errorPage";
            }
         } catch (Exception e) {
            model.addAttribute("msg", e.toString());
            return "common/errorPage";
         }

      }
    //비밀번호 페이지 (일반회원만 보이게)
      @RequestMapping(value="/qna/pwInputView.kh", method=RequestMethod.GET)
      public String qnaInputView(
            Model model
            , HttpSession session
            , @RequestParam("qnaNo") Integer qnaNo) {
        Member member = (Member)session.getAttribute("loginAdmin");
        if(member != null && member.getMemberId().equals("admin")) {
           Qna qnaUser = qService.printOneByNo(qnaNo);
           model.addAttribute("qna", qnaUser);
           return "qna/qnaDetailView";
        }else {
           model.addAttribute("qnaNo", qnaNo);
           return "/qna/pwInputForm";
        }
      }
    
    //비밀번호 입력
      @RequestMapping(value="/qna/pwInputForm.kh", method=RequestMethod.GET)
      public String memberJoinView(Model model
            ,@RequestParam("qnaNo") Integer qnaNo
            ,@RequestParam("qnaPw") String qnaPw) {
         Qna qna = new Qna();
         qna.setQnaNo(qnaNo);
         qna.setQnaPw(qnaPw);
         
         Qna qnaUser = qService.qnaLogin(qna);
         qService.updateCount(qnaNo);
        	 
          if (qnaUser != null) {
               model.addAttribute("qna", qnaUser);
               return "/qna/qnaDetailView";
            } else {
               model.addAttribute("msg", "게시글 조회 실패");
               return "common/errorPage";
            }
      }
      
      //관리자 답변등록
      @RequestMapping(value="/qna/adminRegister.kh", method=RequestMethod.POST)
      public String adminQnaRegister(
            Model model
            , @ModelAttribute Qna qna
            , HttpServletRequest request) {
         try {
            int result = qService.adminInsertQna(qna);
            if(result > 0) {
               return "redirect:/qna/adlist.kh";
            }else {
               model.addAttribute("msg", "게시글 등록 실패!");
               return "common/errorPage";
            }
         }catch(Exception e) {
            model.addAttribute("msg", e.toString());
            return "common/errorPage";
         }
      }
      
      @RequestMapping(value="/qna/adlist.kh", method=RequestMethod.GET)
      public String adminQnaListView(
            Model model
            , @RequestParam(value="page", required=false) Integer page) {
         int currentPage = (page != null) ? page : 1;
         // 비즈니스 로직 -> DB에서 전체 게시물 갯수 가져옴
         int totalCount = qService.getListCount();
         PageInfo pi = QnaPagenation.getPageInfo(currentPage, totalCount);
         // 비즈니스 로직 -> DB에서 데이터를 가져와야 함
         List<Qna> qList = qService.printAll(pi);
         model.addAttribute("qList", qList);
         model.addAttribute("pi", pi);
         return "qna/qnaAdminListView";
      }
      
      @RequestMapping(value="/qna/adDetail.kh", method=RequestMethod.GET)
      public String adminQnaDetailView(
            Model model
            , @RequestParam("qnaNo") Integer qnaNo) {
         // 조회수 증가 - 비즈니스 로직
         qService.updateCount(qnaNo);
         // 비즈니스 로직
         Qna qna = qService.printOneByNo(qnaNo);
         if(qna != null) {
            model.addAttribute("qna", qna);
            return "qna/adminDetailView";
         }else {
            model.addAttribute("msg", "게시글 조회 실패");
            return "common/errorPage";
         }
      }
      
      //문의 건의타임라인 
      @RequestMapping(value="/qna/Timeline.kh", method=RequestMethod.GET)
      public String qnaTimeline(
            Model model
            ,@RequestParam(value="qnaWriter", required=false) String qnaWriter) {
         List<Qna> qnaList = qService.printAllById(qnaWriter);
         if(qnaList != null) {
            model.addAttribute("qList", qnaList);
         }
         return "qna/qnaTimeline";
      }
      // 게시글 수정
      @RequestMapping(value = "/qna/adUpdate.kh", method = RequestMethod.GET)
      public String adminUpdateView(Model model, @RequestParam("qnaNo") Integer qnaNo) {

         Qna qna = qService.printOneByNo(qnaNo);
         if (qna != null) {
            model.addAttribute("qna", qna);
            return "qna/adminUpdateForm";
         } else {
            model.addAttribute("msg", "게시글 조회 실패");
            return "common/errorPage";
         }
      }

      @RequestMapping(value = "/qna/adModify.kh", method = RequestMethod.POST)
      public String adminModify(@RequestParam("qnaNo") Integer qnaNo, Model model, @ModelAttribute Qna qna) {

         try {
            int result = qService.modifyQna(qna);
            if (result > 0) {
               return "redirect:/qna/adlist.kh";
            } else {
               model.addAttribute("msg", "게시글 수정 실패");
               return "common/errorPage";
            }
         } catch (Exception e) {
            model.addAttribute("msg", e.toString());
            return "common/errorPage";
         }

      }
}