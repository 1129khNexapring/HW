package org.kh.hw.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.member.domain.Member;

public interface MemberStore {

	public int insertMember(SqlSession sqlSession, Member member);

	public Member selectLoginMember(SqlSession sqlSession, Member member);

	public int updateMember(SqlSession sqlSession, Member member);

	public int deleteMember(SqlSession sqlSession, Member member);

	public List<Member> find_id(Member member, SqlSession sqlSession);

	public List<Member> find_pwd(Member member, SqlSession sqlSession);
	
	public int checkIdDup(SqlSession session, String memberId); // 아이디 중복 확인
}
