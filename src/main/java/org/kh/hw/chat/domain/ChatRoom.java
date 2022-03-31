package org.kh.hw.chat.domain;

public class ChatRoom {
	private int roomid;
	private String reg_date;
	private String name;
	private String phone;
	private String memberId;
	private String content;
	private String adcontent;
	private String recv_mem;
	private String send_mem;
	private String isReading;
	
	public ChatRoom() {}

	public int getRoomid() {
		return roomid;
	}

	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAdcontent() {
		return adcontent;
	}

	public void setAdcontent(String adcontent) {
		this.adcontent = adcontent;
	}

	
	public String getRecv_mem() {
		return recv_mem;
	}

	public void setRecv_mem(String recv_mem) {
		this.recv_mem = recv_mem;
	}

	public String getSend_mem() {
		return send_mem;
	}

	public void setSend_mem(String send_mem) {
		this.send_mem = send_mem;
	}

	
	public String getIsReading() {
		return isReading;
	}

	public void setIsReading(String isReading) {
		this.isReading = isReading;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomid=" + roomid + ", reg_date=" + reg_date + ", name=" + name + ", phone=" + phone
				+ ", memberId=" + memberId + ", content=" + content + ", adcontent=" + adcontent + ", recv_mem="
				+ recv_mem + ", send_mem=" + send_mem + ", isReading=" + isReading + "]";
	}

	

	
	
	

}
