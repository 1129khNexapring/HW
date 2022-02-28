package org.kh.hw.doctor.domain;

public class Doctor {
	private int doctorNo;
	private String doctorId;
	private String doctorPw;
	private String doctorName;
	private String doctorDpt;
	private String doctorPhone;
	private String doctorEmail;
	
	public Doctor() {}

	public int getDoctorNo() {
		return doctorNo;
	}

	public void setDoctorNo(int doctorNo) {
		this.doctorNo = doctorNo;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorPw() {
		return doctorPw;
	}

	public void setDoctorPw(String doctorPw) {
		this.doctorPw = doctorPw;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctorDpt() {
		return doctorDpt;
	}

	public void setDoctorDpt(String doctorDpt) {
		this.doctorDpt = doctorDpt;
	}

	public String getDoctorPhone() {
		return doctorPhone;
	}

	public void setDoctorPhone(String doctorPhone) {
		this.doctorPhone = doctorPhone;
	}

	public String getDoctorEmail() {
		return doctorEmail;
	}

	public void setDoctorEmail(String doctorEmail) {
		this.doctorEmail = doctorEmail;
	}

	@Override
	public String toString() {
		return "Doctor [doctorNo=" + doctorNo + ", doctorId=" + doctorId + ", doctorPw=" + doctorPw + ", doctorName="
				+ doctorName + ", doctorDpt=" + doctorDpt + ", doctorPhone=" + doctorPhone + ", doctorEmail="
				+ doctorEmail + "]";
	}
	
	

}
