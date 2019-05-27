package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/jsp_term_project"
					+ "?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "YOUR Data Base Password";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {

		}
		return null;
	}
}
