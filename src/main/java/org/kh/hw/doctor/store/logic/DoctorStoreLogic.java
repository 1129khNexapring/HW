package org.kh.hw.doctor.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.doctor.domain.Doctor;
import org.kh.hw.doctor.store.DoctorStore;
import org.springframework.stereotype.Repository;

@Repository
public class DoctorStoreLogic implements DoctorStore{

	@Override
	public int insertDoctor(SqlSession sqlSession, Doctor doctor) {
		int result = sqlSession.insert("DoctorMapper.insertDoctor", doctor);
		return result;
	}

	@Override
	public Doctor selectLoginDoctor(SqlSession sqlSession, Doctor doctor) {
		Doctor doctorOne = sqlSession.selectOne("DoctorMapper.selectLoginDoctor", doctor);
		return doctorOne;
	}

	@Override
	public int updateDoctor(SqlSession sqlSession, Doctor doctor) {
		int result = sqlSession.update("DoctorMapper.updateDoctor",doctor);
		return result;
	}

	@Override
	public int deleteDoctor(SqlSession sqlSession, Doctor doctor) {
		int result = sqlSession.delete("DoctorMapper.deleteDoctor", doctor);
		return result;
	}
	
	@Override
	public List<Doctor> find_doc_id(Doctor doctor, SqlSession sqlSession) {
		List<Doctor> doctorOne= sqlSession.selectList("DoctorMapper.find_doc_id", doctor);
		return doctorOne;
	}

	@Override
	public List<Doctor> find_doc_pwd(Doctor doctor, SqlSession sqlSession) {
		List<Doctor> doctorOne= sqlSession.selectList("DoctorMapper.find_doc_pwd", doctor);
		return doctorOne;
	}
	
	@Override
	public int checkIdDup(SqlSession session, String doctorId) {
		int result = session.selectOne("DoctorMapper.checkIdDup", doctorId);
		return result;
	}
}
