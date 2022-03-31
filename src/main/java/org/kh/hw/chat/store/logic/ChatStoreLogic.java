package org.kh.hw.chat.store.logic;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.kh.hw.chat.domain.ChatRoom;
import org.kh.hw.chat.store.ChatStore;
import org.springframework.stereotype.Repository;

@Repository
public class ChatStoreLogic implements ChatStore {

	@Override
	public int insertChatroom(SqlSession sqlSession, ChatRoom chatroom) {
		int result = sqlSession.insert("chatMapper.insertChatroom", chatroom);
		return result;
	}

	@Override
	public int insertMemChatroom(SqlSession sqlSession, ChatRoom chatroom) {
		int result = sqlSession.insert("chatMapper.insertMemChatroom", chatroom);
		return result;
	}

	@Override
	public int insertChatAdroom(SqlSession sqlSession, ChatRoom chatroom) {

		int result = sqlSession.insert("chatMapper.insertChatAdroom", chatroom);
		return result;
	}

	@Override
	public List<ChatRoom> getHisList(SqlSession sqlSession) {
		List<ChatRoom> chatroom = sqlSession.selectList("chatMapper.getHisList");
		return chatroom;
	}

	@Override
	public List<ChatRoom> ListView(SqlSession sqlSession) {
		List<ChatRoom> chatroom = sqlSession.selectList("chatMapper.ListView");
		return chatroom;
	}

	@Override
	public List<ChatRoom> ChatView(SqlSession sqlSession, String name) {
		List<ChatRoom> chatroom = sqlSession.selectList("chatMapper.ChatView", name);
		return chatroom;
	}

	@Override
	public int updateIsReading(SqlSession sqlSession, String name) {
		int result = sqlSession.update("chatMapper.updateIsReading", name);
		return result;
	}

}
