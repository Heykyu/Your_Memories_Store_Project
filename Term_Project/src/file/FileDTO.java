package file;


public class FileDTO {
	private String fileName;
	private String comment;
	private int pictureID;
	private String fileUploadDate;
	private String userID;
	private int likeCount;
	
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public int getLikeCount() {
		return likeCount;
	}
	
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
	

	public FileDTO() {
	}

	public FileDTO(String fileName, String comment, int pictureID, String fileUploadDate,
			String userID, int likeCount) {
		super();
		this.fileName = fileName;
		this.comment = comment;
		this.pictureID = pictureID;
		this.fileUploadDate = fileUploadDate;
		this.userID = userID;
		this.likeCount = likeCount;
	}
	
	
}
