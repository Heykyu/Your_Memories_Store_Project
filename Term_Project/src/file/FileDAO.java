package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DatabaseUtil;

public class FileDAO {
	
	
	public ArrayList<FileDTO> getPhotoListById() {
		ArrayList<FileDTO> photoList = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT * from file  ORDER BY fileUploadDate";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			
			rs = pstmt.executeQuery();
			
			photoList = new ArrayList<FileDTO>();
			
			while(rs.next()) {
				FileDTO file = new FileDTO();
				file.setPictureID(rs.getInt("pictureID"));
				file.setFileName("http://localhost:8080/Term_Project/upload/"+rs.getString("fileName").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				file.setUserID(rs.getString("userID"));			
				file.setComment(rs.getString("comment").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int uploadTime = Integer.parseInt(rs.getString("fileUploadDate").substring(11, 13));
				file.setLikeCount(rs.getInt("likeCount"));
				
				String timeType = "오전";
				
				if(uploadTime > 12) {
					timeType = "오후";
					uploadTime -= 12;
				}
				
				file.setFileUploadDate(rs.getString("fileUploadDate").substring(0, 11) + " " + timeType + " " + uploadTime + ":" + rs.getString("fileUploadDate").substring(14, 16) + "");
				
				photoList.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return photoList;  //리스트 반환
	}
	
	public int upload(FileDTO fileDTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "INSERT INTO FILE VALUE (?, ?, ?, NOW(), NULL, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, fileDTO.getFileName());
			pstmt.setString(2, fileDTO.getComment());
			pstmt.setString(3, fileDTO.getUserID());
			pstmt.setInt(4, fileDTO.getLikeCount());
			
			return pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;  //데이터베이스 오류
	}
}
