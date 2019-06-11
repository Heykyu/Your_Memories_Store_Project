package file;

import java.sql.Date;

public class FileDTO {
	private String fileName;
	private String fileRealName;
	private String comment;
	private int pictureID;
	private String fileUploadDate;
	private String userID;
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getPictureID() {
		return pictureID;
	}

	public void setPictureID(int pictureID) {
		this.pictureID = pictureID;
	}

	public String getFileUploadDate() {
		return fileUploadDate;
	}

	public void setFileUploadDate(String fileUploadDate) {
		this.fileUploadDate = fileUploadDate;
	}
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

}
