package org.kh.hw.chat.service.logic;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.chat.domain.ChatRoom;
import org.kh.hw.chat.service.ChatService;
import org.kh.hw.chat.store.ChatStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private ChatStore cStore;
	
	

	@Override
	public int createChatRoom(ChatRoom chatroom) {
		int result = cStore.insertChatroom(sqlSession, chatroom);
		return result;
	}

	
	@Override
	public int createChatMemRoom(ChatRoom chatroom) {
		int result = cStore.insertMemChatroom(sqlSession, chatroom);
		return result;
	}
	/*
	 * @Override public ChatRoom printOneById(String name) { ChatRoom chatroom =
	 * cStore.selectOneById(sqlSession, name); return chatroom; }
	 */

	@Override
	public List<ChatRoom> getHisList() {
		List<ChatRoom>chatroom = cStore.getHisList(sqlSession);
		return chatroom;
	}


	@Override
	public List<ChatRoom> getList() {
		List<ChatRoom>chatroom = cStore.ListView(sqlSession); 
		return chatroom;
	
	}


	
	 


	@Override
	public List<ChatRoom> printByName(String name) {
		List<ChatRoom> chatroom = cStore.ChatView(sqlSession, name);
		return chatroom;
	}
	 



	
	 @Override public int createChatAdRoom(ChatRoom chatroom) { 
		 int result = cStore.insertChatAdroom(sqlSession, chatroom); return result; 
	  }



	@Override
	public int updateIsReading(String name) {
		int result = cStore.updateIsReading(sqlSession, name);
		return result;
	}


	

}
