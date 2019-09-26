package co.onOff.DTO;

public class LikesDTO {

	private int likesId;
	private String userId;
	private int storeId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getStoreId() {
		return storeId;
	}

	public int getLikesId() {
		return likesId;
	}

	public void setLikesId(int likesId) {
		this.likesId = likesId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

}
