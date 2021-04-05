package purchaseList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.UserDTO;
import util.DBUser;

public class PurchaseListDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public PurchaseListDAO() {

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

	public int addPurchase(int itemCode, String ID, String postal_code, String user_address, String card_company,
			String card_number) {
		String SQL = "INSERT INTO purchase_list VALUES(?,?,NOW(),?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			pstmt.setString(2, ID);
			pstmt.setString(3, "folderName"); // 일단 예시(추후 수정 필요 할 수도 있음)
			pstmt.setString(4, postal_code + "|" + user_address);
			pstmt.setString(5, card_company + "|" + card_number);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB오류

	}
}
