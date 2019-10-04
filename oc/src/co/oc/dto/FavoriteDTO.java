package co.oc.dto;

import java.sql.Date;

public class FavoriteDTO {
	
	private String userNum;
	private String storeNum;
	private String storeName;
	private String storeCateg1;
	private String storeCateg2;
	private String storeCateg3;
	private Date favoDate;
	
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
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreCateg1() {
		return storeCateg1;
	}
	public void setStoreCateg1(String storeCateg1) {
		this.storeCateg1 = storeCateg1;
	}
	public String getStoreCateg2() {
		return storeCateg2;
	}
	public void setStoreCateg2(String storeCateg2) {
		this.storeCateg2 = storeCateg2;
	}
	public String getStoreCateg3() {
		return storeCateg3;
	}
	public void setStoreCateg3(String storeCateg3) {
		this.storeCateg3 = storeCateg3;
	}
	public Date getFavoDate() {
		return favoDate;
	}
	public void setFavoDate(Date favoDate) {
		this.favoDate = favoDate;
	}
	
}
