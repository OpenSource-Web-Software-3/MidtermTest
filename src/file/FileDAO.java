package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUser;

public class FileDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public FileDAO() {

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

	public int upload(int bbsID, String fileName, String fileRealName) { // 나중에 실데이터 삽입 시 DB에 편하게 업로드하기 위한 메소드
		String SQL = "INSERT INTO file VALUES(null, ?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, fileName);
			pstmt.setString(3, fileRealName);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public FileDTO getFile(int itemCode) {
		String SQL = "SELECT * FROM file WHERE itemCode = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				FileDTO fileDto = new FileDTO();
				fileDto.setItemCode(rs.getInt(1));
				fileDto.setFileName(rs.getString(2));
				fileDto.setFileRealName(rs.getString(3));
				return fileDto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	public String getFilePath(int itemCode) {
		String SQL = "SELECT * FROM file WHERE itemCode = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ""; //사진이 없는 경우

	}
}
