package menu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUser;

public class MenuDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MenuDAO() {

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
