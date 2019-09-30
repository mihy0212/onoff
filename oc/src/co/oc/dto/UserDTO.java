package co.oc.dto;

import java.sql.Date;

public class UserDTO {
	
	private String userNum;
	private String userEmail;
	private String userPw;
	private String userName;
	private String userNick;
	private String userAddr;
	private String userXy;
	private String userGrant;
	private String storeNum;
	private Date userInday;
	
	

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserXy() {
		return userXy;
	}

	public void setUserXy(String userXy) {
		this.userXy = userXy;
	}

	public String getUserGrant() {
		return userGrant;
	}

	public void setUserGrant(String userGrant) {
		this.userGrant = userGrant;
	}

	public String getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}

	public Date getUserInday() {
		return userInday;
	}

	public void setUserInday(Date userInday) {
		this.userInday = userInday;
	}
}
