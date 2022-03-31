package org.kh.hw.chat.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.kh.hw.chat.domain.ChatRoom;
import org.kh.hw.chat.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ChatController {
	 @Autowired
	    ChatService cService;
	    
	 
	 	//관리자 회원, 비회원 전체 채팅 리스트 조회
	    @RequestMapping(value= "/chat/list.kh", method=RequestMethod.GET)
	    public String showList(Model model) {
	    	try {
	    	List<ChatRoom> cList = cService.getList();
			
			 
			  
			  if(!cList.isEmpty()) {
	    		model.addAttribute("cList", cList);
	    		
	    		
	    			return "chat/listtest";
	    	}else {
	    		model.addAttribute("msg", "채팅방 조회 실패");
				return "common/errorPage";
	    		}
	    	}catch(Exception e) {
				model.addAttribute("msg", e.toString());
				return "common/errorPage";
	    		
	    	}
	    	
	    	
	    
	    }
	    
	    
		/*
		 * @RequestMapping(value= "/chat/modify.kh", method=RequestMethod.GET) public
		 * String modify(Model model) { try { List<ChatRoom> cList = cService.getList();
		 * if(!cList.isEmpty()) { model.addAttribute("cList", cList); return
		 * "chat/update"; }else { model.addAttribute("msg", "게시글 조회 실패"); return
		 * "common/errorPage"; } }catch(Exception e) { model.addAttribute("msg",
		 * e.toString()); return "common/errorPage";
		 * 
		 * }
		 * 
		 * }
		 */
	   
	    @RequestMapping(value = "/chat/update.kh", method = {RequestMethod.GET, RequestMethod.PUT})
	  public String updateView(Model model, @RequestParam("name")String name, @ModelAttribute ChatRoom chatroom) {
	       int result = cService.updateIsReading(name); //isReading n-> y로 update 해주기 위해 추가
	       try {
	         if(result >0) {
	        	 model.addAttribute("name", chatroom);
	           return "redirect: /chat/list.kh";
	           }else {
	            model.addAttribute("msg", "수정 실패");
	                    return "common/errorPage";
	        } 
	        
	        }catch (Exception e) {
	      
	                model.addAttribute("msg", e.toString());
	                return "common/errorPage";
	          }
	    }
	    
	    
	    //관리자 회원 채팅리스트 상세조회 및 채팅메시지 작성
	    @RequestMapping(value= "/chat/detail.kh", method=RequestMethod.GET)
	    public String chatDetail(HttpServletResponse response, @RequestParam("name")String name,  Model model) {
	    	List<ChatRoom> chatroom = cService.printByName(name);
	    	if(chatroom != null) {
	    		model.addAttribute("room", chatroom);
	    			return "chat/detail";
	    	}else {
	    		model.addAttribute("msg", "채팅조회 실패");
				return "common/errorPage";
	    	}
	   
	    	
	    }
	 
	 
	    //상담요청 페이지
	    @RequestMapping(value= "/chat/req.kh", method=RequestMethod.GET)
	    public String showAdd() {
	    			return "chat/add2";
	  	
	    }   
	 
	    //비회원, 회원 상담 채팅 작성 및 채팅메시지 확인
		@RequestMapping(value = "/chat/write.kh", method = RequestMethod.GET)
		public String chatWrite(Model model, HttpServletResponse response) {
			List<ChatRoom> chatroom = cService.getHisList();
			
			if (!chatroom.isEmpty() || chatroom.isEmpty()) {
				model.addAttribute("croom", chatroom);
				
				return "chat/add";
			} else {
				return "common/errorPage";
			}
		}
	
		//비회원 상담 채팅 작성
	    @RequestMapping(value = "/chat/doAdd.kh", method=RequestMethod.POST)
	    public String doAdd(Model model,
	    		@ModelAttribute ChatRoom chatroom)throws UnsupportedEncodingException {
	    	try {
				int result = cService.createChatRoom(chatroom);
				if(result > 0) {
					return "redirect:/chat/write.kh";
				} else {
					model.addAttribute("msg", "채팅방 생성 실패");
					return "common/errorPage";
				}
			}catch(Exception e) {
				model.addAttribute("msg", e.toString());
				return "common/errorPage";
			}
	    }
	  
	    
	    //회원 상담 채팅 작성
	    @RequestMapping(value = "/chat/doMemAdd.kh", method=RequestMethod.POST)
	    public String doMemAdd(Model model,
	    		@ModelAttribute ChatRoom chatroom)throws UnsupportedEncodingException {
	    	try {
				int result = cService.createChatMemRoom(chatroom);
				if(result > 0) {
					return "redirect:/chat/write.kh";
				} else {
					model.addAttribute("msg", "채팅방 생성 실패");
					return "common/errorPage";
				}
			}catch(Exception e) {
				model.addAttribute("msg", e.toString());
				return "common/errorPage";
			}
	    }
	    
	   
	    //관리자 상담채팅 작성
	    @RequestMapping(value = "/chat/adminWrite.kh", method=RequestMethod.POST)
	    public String doAdAdd(Model model,
	    		@ModelAttribute ChatRoom chatroom)throws UnsupportedEncodingException {
	    	try {
				int result = cService.createChatAdRoom(chatroom);
				if(result > 0) {
					return "redirect:/chat/list.kh";
				} else {
					model.addAttribute("msg", "채팅방 생성 실패");
					return "common/errorPage";
				}
			}catch(Exception e) {
				model.addAttribute("msg", e.toString());
				return "common/errorPage";
			}
	    }
	    
}
