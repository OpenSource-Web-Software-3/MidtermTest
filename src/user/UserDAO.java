package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBuser.DBUser;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {

		try {
//			String dbURL = "jdbc:mysql://localhost:3306/shopping_midtermtest";
//			String dbID = "root";
//			String dbPassword = "";
			
			Class.forName("com.mysql.jdbc.Driver");
			DBUser DBuser = new DBUser();

			conn = DriverManager.getConnection(DBuser.dbURL, DBuser.dbID, DBuser.dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
