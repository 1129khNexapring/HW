package org.kh.hw.reservation.domain;

import java.sql.Date;

public class Res {
	private String resNo;
	private String memberId;
	private String resName;
	private String birth;
	private String phone;
	private String department;
	private String deptStaff;
	private Date deptDate;
	private String deptTime;
	private String doctorId;
	private String status;
	
	public Res() {}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDeptStaff() {
		return deptStaff;
	}

	public void setDeptStaff(String deptStaff) {
		this.deptStaff = deptStaff;
	}

	public Date getDeptDate() {
		return deptDate;
	}

	public void setDeptDate(Date deptDate) {
		this.deptDate = deptDate;
	}

	public String getDeptTime() {
		return deptTime;
	}

	public void setDeptTime(String deptTime) {
		this.deptTime = deptTime;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Res [resNo=" + resNo + ", memberId=" + memberId + ", resName=" + resName + ", birth=" + birth
				+ ", phone=" + phone + ", department=" + department + ", deptStaff=" + deptStaff + ", deptDate="
				+ deptDate + ", deptTime=" + deptTime + ", doctorId=" + doctorId + ", status=" + status + "]";
	}
	
}
