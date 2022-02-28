package org.kh.hw.reservation.domain;

import java.sql.Date;

public class Reservation {
	
	private String tresNo;
	private String tresMemId;
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
	
	public Reservation() {}

	public String getTresNo() {
		return tresNo;
	}

	public void setTresNo(String tresNo) {
		this.tresNo = tresNo;
	}

	public String getTresMemId() {
		return tresMemId;
	}

	public void setTresMemId(String tresMemId) {
		this.tresMemId = tresMemId;
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

	@Override
	public String toString() {
		return "Reservation [tresNo=" + tresNo + ", tresMemId=" + tresMemId + ", department=" + department
				+ ", deptStaff=" + deptStaff + ", resName=" + resName + ", deptDate=" + deptDate + ", deptTime="
				+ deptTime + ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", acc=" + acc
				+ ", fileName=" + fileName + ", fileRename=" + fileRename + "]";
	}

}
