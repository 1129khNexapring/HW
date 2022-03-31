package org.kh.hw.chat.store;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.chat.domain.ChatRoom;


public interface ChatStore {

	public int insertChatroom(SqlSession sqlSession, ChatRoom chatroom);
	public int insertMemChatroom(SqlSession sqlSession, ChatRoom chatroom);
	public int insertChatAdroom(SqlSession sqlSession, ChatRoom chatroom);
	public List<ChatRoom> getHisList(SqlSession sqlSession);
	public List<ChatRoom> ListView(SqlSession sqlSession);
	public List<ChatRoom> ChatView(SqlSession sqlSession, String name);
	public int updateIsReading(SqlSession sqlSession, String name);
		
}
