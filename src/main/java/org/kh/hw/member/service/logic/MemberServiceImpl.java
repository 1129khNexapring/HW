package org.kh.hw.member.service.logic;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.member.domain.Member;
import org.kh.hw.member.service.MemberService;
import org.kh.hw.member.store.MemberStore;
import org.kh.hw.notice.domain.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int registerMember(Member member) {
		int result = mStore.insertMember(sqlSession, member);
		return result;
	}

	@Override
	public Member loginMember(Member member) {
		Member memberOne = mStore.selectLoginMember(sqlSession, member);
		return memberOne;
	}
	
	@Override
	public int modifyMember(Member member) {
		int result = mStore.updateMember(sqlSession,member);
		return result;
	}

	@Override
	public int removeMember(Member member) {
		int result = mStore.deleteMember(sqlSession,member);
		return result;
	}

	@Override
	public List<Member> find_id(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
	
			out = response.getWriter();
			List<Member> id= mStore.find_id(member, sqlSession);
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				return null;
			}else {
				return id;
			}
	}

	@Override
	public List<Member> find_pwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
	
			out = response.getWriter();
			List<Member> pwd= mStore.find_pwd(member, sqlSession);
			if(pwd == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				return null;
			}else {
				return pwd;
			}
	}
	
	@Override
	public int checkIdDup(String memberId) {
		int result = mStore.checkIdDup(sqlSession, memberId);
		return result;
	}

}
