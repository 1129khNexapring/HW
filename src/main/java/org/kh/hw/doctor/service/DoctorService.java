package org.kh.hw.doctor.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.kh.hw.doctor.domain.Doctor;

public interface DoctorService {
	
	public int registerDoctor(Doctor doctor);
	
	public Doctor loginDoctor(Doctor doctor);
	
	public int modifyDoctor(Doctor doctor);
	
	public int removeDoctor(Doctor doctor);
	
	public List<Doctor> find_doc_id(HttpServletResponse response, Doctor doctor) throws IOException;

	public List<Doctor> find_doc_pwd(HttpServletResponse response, Doctor doctor) throws IOException;

	public int checkIdDup(String doctorId); // 아이디 중복 확인

	public List<String> printAllDpt();

	public List<Doctor> printAll(String doctorDpt);
}
