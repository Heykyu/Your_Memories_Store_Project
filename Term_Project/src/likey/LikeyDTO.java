package likey;

public class LikeyDTO {
	
	String userID;
	int pictureID;
	String userIP;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getPictureID() {
		return pictureID;
	}
	public void setPictureID(int pictureID) {
		this.pictureID = pictureID;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	public LikeyDTO() {}
	
	public LikeyDTO(String userID, int pictureID, String userIP) {
		super();
		this.userID = userID;
		this.pictureID = pictureID;
		this.userIP = userIP;
	}
	
}
