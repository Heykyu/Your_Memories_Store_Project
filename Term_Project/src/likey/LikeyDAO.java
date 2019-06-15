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
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			pstmt.setInt(2, pictureID); 
			pstmt.setString(3, userIP); 
			
			//delete update insert into 같은것은 executeUpdate()로 처리한다.
			//반환 값은 데이터의 갯수를 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return -1; //회원가입 실패
	}
}
