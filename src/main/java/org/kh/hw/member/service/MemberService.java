package org.kh.hw.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.kh.hw.member.domain.Member;

public interface MemberService {

	public int registerMember(Member member);

	public Member loginMember(Member member);

	public int modifyMember(Member member);

	public int removeMember(Member member);
	
	public List<Member> find_id(HttpServletResponse response, Member member) throws Exception;
	
	public List<Member> find_pwd(HttpServletResponse response, Member member) throws Exception;
	
	public int checkIdDup(String memberId); // 아이디 중복 확인
}
