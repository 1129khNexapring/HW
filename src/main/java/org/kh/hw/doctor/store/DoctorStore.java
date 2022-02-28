package org.kh.hw.doctor.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.doctor.domain.Doctor;

public interface DoctorStore {

	public int insertDoctor(SqlSession sqlSession, Doctor doctor);
	
	public Doctor selectLoginDoctor(SqlSession sqlSession, Doctor doctor);
	
	public int updateDoctor(SqlSession sqlSession, Doctor doctor);
	
	public int deleteDoctor(SqlSession sqlSession, Doctor doctor);
	
	public List<Doctor> find_doc_id(Doctor doctor, SqlSession sqlSession);

	public List<Doctor> find_doc_pwd(Doctor doctor, SqlSession sqlSession);

	public int checkIdDup(SqlSession session, String doctorId); // 아이디 중복 확인
}
