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
   //gdsg
   @Autowired
   private QnaService qService;
   @RequestMapping(value="/qna/list.kh", method=RequestMethod.GET)
   public String qnaListView(
         Model model
         , @RequestParam(value="page", required=false) Integer page) {
      int currentPage = (page != null) ? page : 1;
      // 鍮꾩쫰�땲�뒪 濡쒖쭅 -> DB�뿉�꽌 �쟾泥� 寃뚯떆臾� 媛��닔 媛��졇�샂
      int totalCount = qService.getListCount();
      PageInfo pi = QnaPagenation.getPageInfo(currentPage, totalCount);
      // 鍮꾩쫰�땲�뒪 濡쒖쭅 -> DB�뿉�꽌 �뜲�씠�꽣瑜� 媛��졇���빞 �븿
      List<Qna> qList = qService.printAll(pi);
      model.addAttribute("qList", qList);
      model.addAttribute("pi", pi);
      return "qna/qnaListView";
   }

   @RequestMapping(value="/qna/detail.kh", method=RequestMethod.GET)
   public String qnaDetailView(
         Model model
         , @RequestParam("qnaNo") Integer qnaNo) {
      // 議고쉶�닔 利앷� - 鍮꾩쫰�땲�뒪 濡쒖쭅
      qService.updateCount(qnaNo);
      // 鍮꾩쫰�땲�뒪 濡쒖쭅
      Qna qna = qService.printOneByNo(qnaNo);
      if(qna != null) {
         model.addAttribute("qna", qna);
         return "qna/qnaDetailView";
      }else {
         model.addAttribute("msg", "寃뚯떆湲� 議고쉶 �떎�뙣");
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
            model.addAttribute("msg", "寃뚯떆湲� �벑濡� �떎�뙣!");
            return "common/errorPage";
         }
      }catch(Exception e) {
         model.addAttribute("msg", e.toString());
         return "common/errorPage";
      }
   }
   
   //寃뚯떆湲� �궘�젣
   @RequestMapping(value="/qna/remove.kh", method=RequestMethod.GET)
   public String qnaRemove(
         Model model
         , @RequestParam("qnaNo") int qnaNo) {
      try {
         int result = qService.removeQna(qnaNo);
         if(result > 0) {
            
            return "redirect:/qna/list.kh";
         }else {
            model.addAttribute("msg", "寃뚯떆湲� �궘�젣 �떎�뙣");
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
            model.addAttribute("msg", "寃뚯떆湲� 議고쉶 �떎�뙣");
            return "common/errorPage";
         }
      }
   	// 寃뚯떆湲� �닔�젙
      @RequestMapping(value = "/qna/modify.kh", method = RequestMethod.POST)
      public String qnaModify(@RequestParam("qnaNo") Integer qnaNo, Model model, @ModelAttribute Qna qna) {

         try {
            int result = qService.modifyQna(qna);
            if (result > 0) {
               return "redirect:/qna/list.kh";
            } else {
               model.addAttribute("msg", "寃뚯떆湲� �닔�젙 �떎�뙣");
               return "common/errorPage";
            }
         } catch (Exception e) {
            model.addAttribute("msg", e.toString());
            return "common/errorPage";
         }

      }
    //鍮꾨�踰덊샇 �럹�씠吏� (�씪諛섑쉶�썝留� 蹂댁씠寃�)
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
    
    //鍮꾨�踰덊샇 �엯�젰
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
               model.addAttribute("msg", "寃뚯떆湲� 議고쉶 �떎�뙣");
               return "common/errorPage";
            }
      }
      
      //愿�由ъ옄 �떟蹂��벑濡�
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
               model.addAttribute("msg", "寃뚯떆湲� �벑濡� �떎�뙣!");
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
         // 鍮꾩쫰�땲�뒪 濡쒖쭅 -> DB�뿉�꽌 �쟾泥� 寃뚯떆臾� 媛��닔 媛��졇�샂
         int totalCount = qService.getListCount();
         PageInfo pi = QnaPagenation.getPageInfo(currentPage, totalCount);
         // 鍮꾩쫰�땲�뒪 濡쒖쭅 -> DB�뿉�꽌 �뜲�씠�꽣瑜� 媛��졇���빞 �븿
         List<Qna> qList = qService.printAll(pi);
         model.addAttribute("qList", qList);
         model.addAttribute("pi", pi);
         return "qna/qnaAdminListView";
      }
      
      @RequestMapping(value="/qna/adDetail.kh", method=RequestMethod.GET)
      public String adminQnaDetailView(
            Model model
            , @RequestParam("qnaNo") Integer qnaNo) {
         // 議고쉶�닔 利앷� - 鍮꾩쫰�땲�뒪 濡쒖쭅
         qService.updateCount(qnaNo);
         // 鍮꾩쫰�땲�뒪 濡쒖쭅
         Qna qna = qService.printOneByNo(qnaNo);
         if(qna != null) {
            model.addAttribute("qna", qna);
            return "qna/adminDetailView";
         }else {
            model.addAttribute("msg", "寃뚯떆湲� 議고쉶 �떎�뙣");
            return "common/errorPage";
         }
      }
      
      //臾몄쓽 嫄댁쓽���엫�씪�씤 
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
      // 寃뚯떆湲� �닔�젙
      @RequestMapping(value = "/qna/adUpdate.kh", method = RequestMethod.GET)
      public String adminUpdateView(Model model, @RequestParam("qnaNo") Integer qnaNo) {

         Qna qna = qService.printOneByNo(qnaNo);
         if (qna != null) {
            model.addAttribute("qna", qna);
            return "qna/adminUpdateForm";
         } else {
            model.addAttribute("msg", "寃뚯떆湲� 議고쉶 �떎�뙣");
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
               model.addAttribute("msg", "寃뚯떆湲� �닔�젙 �떎�뙣");
               return "common/errorPage";
            }
         } catch (Exception e) {
            model.addAttribute("msg", e.toString());
            return "common/errorPage";
         }

      }
}