package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DatabaseUtil;

public class UserDAO {
	
	
	public int insertMember(UserDTO user) {
		String SQL = "insert into user value(?, ?, ?, ?, ?, false, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, user.getUserID()); 
			pstmt.setString(2, user.getUserPassword()); 
			pstmt.setString(3, user.getUserFirstName()); 
			pstmt.setString(4, user.getUserSecondName()); 
			pstmt.setString(5, user.getUserIDHash());
			pstmt.setString(6, user.getUserProfile());
			
			//delete update insert into 같은것은 executeUpdate()로 처리한다.
			//반환 값은 데이터의 갯수를 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1; //회원가입 실패
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
	}
	
	public int update(String userID, String userPassword, String userFirstName, 
			String userSecondName, String userProfile) {
		String SQL = "UPDATE USER SET userPassword = ? , userFirstName = ?, userSecondName = ?, userProfile = ? where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
 
			pstmt.setString(1, userPassword); 
			pstmt.setString(2, userFirstName); 
			pstmt.setString(3, userSecondName); 
			pstmt.setString(4, userProfile);
			pstmt.setString(5, userID);
			
			//delete update insert into 같은것은 executeUpdate()로 처리한다.
			//반환 값은 데이터의 갯수를 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1; //회원가입 실패
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			
			//executeQuery()같은 경우는 데이터를 조회 할 때 쓰는 것
			rs = pstmt.executeQuery();
			
			//SQL 문장이 존재함에 따라 계속해서 실행!
			if(rs.next()) {
				//사용자의 유저 아이디와 패스워드가 같으면 이 문장 실행
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else {
					return 0; //로그인 실패
				}
			}
			
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
			
			return -2; //데이터베이스 오류
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
	}
	
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				return rs.getBoolean(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return false; //DB 오류
	}
	
	public String getUserIDBasedUserEmail(String userID) {
		String SQL = "SELECT userID FROM USER where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return null; //DB 오류
	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			pstmt.executeUpdate();
			
			return true; //이미 인증이 된 상태라도 다시 한번 더 트루를 줘야 인증 유지 가능
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 객체 , 프리페얼 객체, 결과 객체는 한번 사용하면 자원 해제 해주는것이 좋다
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return false; //DB 오류
	}
	
	public UserDTO getUser(String userID) {
		UserDTO userDTO = new UserDTO();
		String SQL = "SELECT * FROM user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userDTO.setUserID(userID);
				userDTO.setUserPassword(rs.getString("userPassword"));
				userDTO.setUserFirstName(rs.getString("userFirstName"));
				userDTO.setUserSecondName(rs.getString("userSecondName"));
				userDTO.setUserProfile(rs.getString("userProfile"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return userDTO;
	}
	
	public String getProfile(String userID) {
		UserDTO userDTO = new UserDTO();
		String SQL = "SELECT userProfile FROM user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//첫 번째 물음표 값에다 userID값을 넣어주는 것
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("userProfile").equals(null)) {
					return "http://localhost:8080/Term_Project/images/icon.png";
				}
				return "http://localhost:8080/Term_Project/profile/" + rs.getString("userProfile");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "http://localhost:8080/Term_Project/images/icon.png";
	}
}
