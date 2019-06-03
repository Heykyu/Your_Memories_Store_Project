package model;

public class UserDTO {
	private String userID;
	private String userPassword;
	private String userFirstName;
	private String userSecondName;
	private String userIDHash;
	private boolean userEmailChecked;
	
	
	public String getUserIDHash() {
		return userIDHash;
	}
	public void setUserIDHash(String userIDHash) {
		this.userIDHash = userIDHash;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public String getUserSecondName() {
		return userSecondName;
	}
	
	public void setUserSecondName(String userSecondName) {
		this.userSecondName = userSecondName;
	}
	
	public UserDTO() {}
	
	
	public UserDTO(String userID, String userPassword, String userFirstName, String userSecondName,
			boolean userEmailChecked, String userIDHash) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userFirstName = userFirstName;
		this.userSecondName = userSecondName;
		this.userEmailChecked = userEmailChecked;
		this.userIDHash = userIDHash;
	}
}
