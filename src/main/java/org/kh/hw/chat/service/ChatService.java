package org.kh.hw.chat.service;


import java.util.List;
import org.kh.hw.chat.domain.ChatRoom;


public interface ChatService  {

	public int createChatRoom(ChatRoom chatroom); //비회원 채팅 작성
	public int createChatMemRoom(ChatRoom chatroom); //회원 채팅 작성
	public int createChatAdRoom(ChatRoom chatroom); //관리자 채팅 작성
	public int updateIsReading(String name); //메시지읽음여부 체크(n->안읽음, y->읽음)
	public List<ChatRoom> getHisList(); //각 비회원 or 회원 채팅 리스트
	public List<ChatRoom> getList(); // 회원, 비회원 전체 채팅 리스트
	public List<ChatRoom> printByName(String name); //관리자 회원 채팅 리스트 상세 조회

}
