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
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, user.getUserID()); 
			pstmt.setString(2, user.getUserPassword()); 
			pstmt.setString(3, user.getUserFirstName()); 
			pstmt.setString(4, user.getUserSecondName()); 
			pstmt.setString(5, user.getUserIDHash());
			pstmt.setString(6, user.getUserProfile());
			
			//delete update insert into �������� executeUpdate()�� ó���Ѵ�.
			//��ȯ ���� �������� ������ ��ȯ
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1; //ȸ������ ����
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
	}
	
	public int update(String userID, String userPassword, String userFirstName, String userSecondName) {
		String SQL = "UPDATE USER SET userPassword = ? , userFirstName = ?, userSecondName = ? where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
 
			pstmt.setString(1, userPassword); 
			pstmt.setString(2, userFirstName); 
			pstmt.setString(3, userSecondName); 
			pstmt.setString(4, userID);
			
			//delete update insert into �������� executeUpdate()�� ó���Ѵ�.
			//��ȯ ���� �������� ������ ��ȯ
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1; //ȸ������ ����
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
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
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, userID); 
			
			//executeQuery()���� ���� �����͸� ��ȸ �� �� ���� ��
			rs = pstmt.executeQuery();
			
			//SQL ������ �����Կ� ���� ����ؼ� ����!
			if(rs.next()) {
				//������� ���� ���̵�� �н����尡 ������ �� ���� ����
				if(rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				} else {
					return 0; //�α��� ����
				}
			}
			
			return -1; //���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
			
			return -2; //�����ͺ��̽� ����
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
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
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				return rs.getBoolean(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return false; //DB ����
	}
	
	public String getUserIDBasedUserEmail(String userID) {
		String SQL = "SELECT userID FROM USER where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return null; //DB ����
	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
			pstmt.setString(1, userID); 
			pstmt.executeUpdate();
			
			return true; //�̹� ������ �� ���¶� �ٽ� �ѹ� �� Ʈ�縦 ��� ���� ���� ����
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//Ŀ�ؼ� ��ü , ������� ��ü, ��� ��ü�� �ѹ� ����ϸ� �ڿ� ���� ���ִ°��� ����
			
			try { if( conn != null ) conn.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( pstmt != null ) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			try { if( rs != null ) rs.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return false; //DB ����
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
			
			//ù ��° ����ǥ ������ userID���� �־��ִ� ��
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
}
