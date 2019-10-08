package co.oc.dto;

import java.sql.Date;

public class StoreDTO {

	private String storeNum;
	private String storeName;
	private String storeAddr;
	private String storeXy;
	private String storeCateg1;
	private String storeCateg2;
	private String storeCateg3;
	private String storePic;
	private String storeTime;
	private String storeTel;
	private String storeMenu;
	private String storeEtc;
	private int storeLike;
	private String userNum;
	private Date storeRegiday;
	private String storeRegidayString;

	public String getStoreRegidayString() {
		return storeRegidayString;
	}

	public void setStoreRegidayString(String storeRegidayString) {
		this.storeRegidayString = storeRegidayString;
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

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	public String getStoreXy() {
		return storeXy;
	}

	public void setStoreXy(String storeXy) {
		this.storeXy = storeXy;
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

	public String getStorePic() {
		return storePic;
	}

	public void setStorePic(String storePic) {
		this.storePic = storePic;
	}

	public String getStoreTime() {
		return storeTime;
	}

	public void setStoreTime(String storeTime) {
		this.storeTime = storeTime;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStoreMenu() {
		return storeMenu;
	}

	public void setStoreMenu(String storeMenu) {
		this.storeMenu = storeMenu;
	}

	public String getStoreEtc() {
		return storeEtc;
	}

	public void setStoreEct(String storeEtc) {
		this.storeEtc = storeEtc;
	}

	public int getStoreLike() {
		return storeLike;
	}

	public void setStoreLike(int storeLike) {
		this.storeLike = storeLike;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public Date getStoreRegiday() {
		return storeRegiday;
	}

	public void setStoreRegiday(Date storeRegiday) {
		this.storeRegiday = storeRegiday;
	}

	@Override
	public String toString() {
		return "StoreDTO [storeNum=" + storeNum + ", storeName=" + storeName + ", storeAddr=" + storeAddr + ", storeXy="
				+ storeXy + ", storeCateg1=" + storeCateg1 + ", storeCateg2=" + storeCateg2 + ", storeCateg3="
				+ storeCateg3 + ", storePic=" + storePic + ", storeTime=" + storeTime + ", storeTel=" + storeTel
				+ ", storeMenu=" + storeMenu + ", storeEct=" + storeEtc + ", storeLike=" + storeLike + ", userNum="
				+ userNum + ", storeRegiday=" + storeRegiday + "]";
	}

}
