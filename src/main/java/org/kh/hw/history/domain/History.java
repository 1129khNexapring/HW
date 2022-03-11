package org.kh.hw.history.domain;

import java.sql.Date;

public class History {
	private String doctorId;
	private String resNo;
	private String resName;
	private Date deptDate;
	private String department;
	private String deptContents;
	private String prescription;
	private int charge;
	private String memberId;
	
	public History() {}

	public History(String doctorId, String resNo, String resName, Date deptDate, String department, String deptContents,
			String prescription, int charge, String memberId) {
		super();
		this.doctorId = doctorId;
		this.resNo = resNo;
		this.resName = resName;
		this.deptDate = deptDate;
		this.department = department;
		this.deptContents = deptContents;
		this.prescription = prescription;
		this.charge = charge;
		this.memberId = memberId;
	}


	public String getDoctorId() {
		return doctorId;
	}



	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}



	public String getResNo() {
		return resNo;
	}



	public void setResNo(String resNo) {
		this.resNo = resNo;
	}



	public String getResName() {
		return resName;
	}



	public void setResName(String resName) {
		this.resName = resName;
	}



	public Date getDeptDate() {
		return deptDate;
	}



	public void setDeptDate(Date deptDate) {
		this.deptDate = deptDate;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	public String getDeptContents() {
		return deptContents;
	}



	public void setDeptContents(String deptContents) {
		this.deptContents = deptContents;
	}



	public String getPrescription() {
		return prescription;
	}



	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}



	public int getCharge() {
		return charge;
	}



	public void setCharge(int charge) {
		this.charge = charge;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	@Override
	public String toString() {
		return "History [doctorId=" + doctorId + ", resNo=" + resNo + ", resName=" + resName + ", deptDate=" + deptDate
				+ ", department=" + department + ", deptContents=" + deptContents + ", prescription=" + prescription
				+ ", charge=" + charge + ", memberId=" + memberId + "]";
	}
	
}

	