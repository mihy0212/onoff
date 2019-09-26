package co.onOff.DTO;

import java.sql.Blob;

public class StoreDTO {

	private int storeId;
	private String storeName;
	private String storeLocation;
	private String storeCategory;
	private String storeType;
	private int storeLike;
	private String storeOwner;
	private String ownerPersonal;
	private String ownerTel;
	private String ownerBusiness;
	private Blob ownerCapture;

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public String getStoreType() {
		return storeType;
	}

	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}

	public int getStoreLike() {
		return storeLike;
	}

	public void setStoreLike(int storeLike) {
		this.storeLike = storeLike;
	}

	public String getStoreOwner() {
		return storeOwner;
	}

	public void setStoreOwner(String storeOwner) {
		this.storeOwner = storeOwner;
	}

	public String getOwnerPersonal() {
		return ownerPersonal;
	}

	public void setOwnerPersonal(String ownerPersonal) {
		this.ownerPersonal = ownerPersonal;
	}

	public String getOwnerTel() {
		return ownerTel;
	}

	public void setOwnerTel(String ownerTel) {
		this.ownerTel = ownerTel;
	}

	public String getOwnerBusiness() {
		return ownerBusiness;
	}

	public void setOwnerBusiness(String ownerBusiness) {
		this.ownerBusiness = ownerBusiness;
	}

	public Blob getOwnerCapture() {
		return ownerCapture;
	}

	public void setOwnerCapture(Blob ownerCapture) {
		this.ownerCapture = ownerCapture;
	}

}
