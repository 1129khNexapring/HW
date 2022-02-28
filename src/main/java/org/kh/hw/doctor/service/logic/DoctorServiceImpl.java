package org.kh.hw.doctor.service.logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.doctor.domain.Doctor;
import org.kh.hw.doctor.service.DoctorService;
import org.kh.hw.doctor.store.DoctorStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctorServiceImpl implements DoctorService {

	@Autowired
	private DoctorStore dStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerDoctor(Doctor doctor) {
		int result = dStore.insertDoctor(sqlSession, doctor);
		return result;
	}

	@Override
	public Doctor loginDoctor(Doctor doctor) {
		Doctor doctorOne = dStore.selectLoginDoctor(sqlSession, doctor);
		return doctorOne;
	}

	@Override
	public int modifyDoctor(Doctor doctor) {
		int result = dStore.updateDoctor(sqlSession,doctor);
		return result;
	}

	@Override
	public int removeDoctor(Doctor doctor) {
		int result = dStore.deleteDoctor(sqlSession,doctor);
		return result;
	}
	
	@Override
	public List<Doctor>find_doc_id(HttpServletResponse response, Doctor doctor) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
	
			out = response.getWriter();
			List<Doctor> id= dStore.find_doc_id(doctor, sqlSession);
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				return null;
			}else {
				return id;
			}
	}

	@Override
	public List<Doctor> find_doc_pwd(HttpServletResponse response, Doctor doctor) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
	
			out = response.getWriter();
			List<Doctor> pwd= dStore.find_doc_pwd(doctor, sqlSession);
			if(pwd == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				return null;
			}else {
				return pwd;
			}
	}
	
	@Override
	public int checkIdDup(String doctorId) {
		int result = dStore.checkIdDup(sqlSession, doctorId);
		return result;
	}
}
