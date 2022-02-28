package org.kh.hw.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.member.domain.Member;
import org.kh.hw.member.store.MemberStore;
import org.kh.hw.notice.domain.Notice;
import org.springframework.stereotype.Repository;

@Repository
public class MemberStroeLogic implements MemberStore{

	@Override
	public int insertMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public Member selectLoginMember(SqlSession sqlSession, Member member) {
		Member memberOne = sqlSession.selectOne("MemberMapper.selectLoginMember", member);
		return memberOne;
	}

	@Override
	public int updateMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.update("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int deleteMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.delete("MemberMapper.deleteMember", member);
		return result;
	}
	
	@Override
	public List<Member> find_id(Member member, SqlSession sqlSession) {
		List<Member> memberOne= sqlSession.selectList("MemberMapper.find_id", member);
		return memberOne;
	}

	@Override
	public List<Member> find_pwd(Member member, SqlSession sqlSession) {
		List<Member> memberOne = sqlSession.selectList("MemberMapper.find_pwd", member);
		return memberOne;
	}
	
	@Override
	public int checkIdDup(SqlSession session, String memberId) {
		int result = session.selectOne("MemberMapper.checkIdDup", memberId);
		return result;
	}
}
