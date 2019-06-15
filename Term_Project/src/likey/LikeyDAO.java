package likey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DatabaseUtil;

public class LikeyDAO {

	public int like(String userID, int pictureID, String userIP) {
		String SQL = "insert into likey value(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, userID); 
			pstmt.setInt(2, pictureID); 
			pstmt.setString(3, userIP); 
			
			//delete update insert into �������� executeUpdate()�� ó���Ѵ�.
			//��ȯ ���� �������� ������ ��ȯ
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return -1; //ȸ������ ����
	}
}
