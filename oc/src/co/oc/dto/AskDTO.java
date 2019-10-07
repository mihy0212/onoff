package co.oc.dto;

import java.sql.Date;

public class AskDTO {

	private String askNum;
	private String askRe;
	private String userNum;
	private String storeNum;
	private String askTitle;
	private String askContent;
	private String askStatus;
	private Date askDate;
	private String userName;
	private String userGrant;
	private String storeName;
	
	
	public String getAskNum() {
		return askNum;
	}
	public void setAskNum(String askNum) {
		this.askNum = askNum;
	}
	public String getAskRe() {
		return askRe;
	}
	public void setAskRe(String askRe) {
		this.askRe = askRe;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskStatus() {
		return askStatus;
	}
	public void setAskStatus(String askStatus) {
		this.askStatus = askStatus;
	}
	public Date getAskDate() {
		return askDate;
	}
	public void setAskDate(Date askDate) {
		this.askDate = askDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGrant() {
		return userGrant;
	}
	public void setUserGrant(String userGrant) {
		this.userGrant = userGrant;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
}
