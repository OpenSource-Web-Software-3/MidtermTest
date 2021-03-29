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

			Class.forName("com.mysql.jdbc.Driver");
			DBUser DBuser = new DBUser();

//			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			conn = DriverManager.getConnection(DBuser.dbURL, DBuser.dbID, DBuser.dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공 = 비밀번호 일치
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB오류
	}

	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getID());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getEmail());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB오류

	}
}
