package purchaseList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import item.ItemDTO;
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

	// servlet에서 getItem getPurchaseItem 둘다 사용
	public ArrayList<PurchaseListDTO> getPurchaseItem(String ID) {
		String SQL = "SELECT * FROM purchase_list WHERE ID = ? ORDER BY purchaseDate DESC";

		ArrayList<PurchaseListDTO> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PurchaseListDTO purchaseListDto = new PurchaseListDTO();
				purchaseListDto.setItemCode(rs.getInt(1));
				purchaseListDto.setID(rs.getString(2));
				purchaseListDto.setPurchaseDate(rs.getString(3).substring(0, 4) + "." + rs.getString(3).substring(5, 7)
						+ "." + rs.getString(3).substring(8, 10));
				purchaseListDto.setFolderName(rs.getString(4));
				purchaseListDto.setUserAddress(rs.getString(5));
				purchaseListDto.setCardNumber(rs.getString(6));
				list.add(purchaseListDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//날짜 별로 for문을 돌리기 위해 날짜만 이용해서 group형식으로 가져옴
	public ArrayList<String> getPurchaseDate(String ID) {
		String SQL = "SELECT substr(purchaseDate,1,10) FROM purchase_list WHERE ID = ? GROUP BY substr(purchaseDate,1,10) ORDER BY purchaseDate DESC";
		ArrayList<String> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1).substring(0, 4) + "." + rs.getString(1).substring(5, 7) + "."
						+ rs.getString(1).substring(8, 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}