package org.kh.hw.reservation.domain;

import java.sql.Date;

public class Reservation {
	
	private String resNo;
	private String memberId;
	private String department;
	private String deptStaff;
	private String resName;
	private Date deptDate;
	private String deptTime;
	private String birth;
	private String phone;
	private String address;
	private String acc;
	private String fileName;
	private String fileRename;
	private String doctorId;
	private String status;
	
	public Reservation() {}

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

	public String getDeptTime() {
		return deptTime;
	}

	public void setDeptTime(String deptTime) {
		this.deptTime = deptTime;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
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
		return "Reservation [resNo=" + resNo + ", memberId=" + memberId + ", department=" + department + ", deptStaff="
				+ deptStaff + ", resName=" + resName + ", deptDate=" + deptDate + ", deptTime=" + deptTime + ", birth="
				+ birth + ", phone=" + phone + ", address=" + address + ", acc=" + acc + ", fileName=" + fileName
				+ ", fileRename=" + fileRename + ", doctorId=" + doctorId + ", status=" + status + "]";
	}

}
