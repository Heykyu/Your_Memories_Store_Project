package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DatabaseUtil;

public class FileDAO {
	
	
	
	public int upload(String fileName, String fileRealName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "insert into file value (?, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, fileName); 
			pstmt.setString(2, fileRealName);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public FileDAO() {
		
	}
}
