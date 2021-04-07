package shopCart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import purchaseList.PurchaseListDTO;
import util.DBUser;

public class ShopCartDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ShopCartDAO() {

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
	
	
	public int addShopCart(int itemCode, String ID,  String folderName) {
		String SQL = "INSERT INTO shopping_cart VALUES(?,?,NOW(),?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			pstmt.setString(2, ID);
			pstmt.setString(3, "folderName"); // 일단 예시(추후 수정 필요 할 수도 있음)
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB오류

	}

	// servlet에서 getItem getPurchaseItem 둘다 사용
	public ArrayList<ShopCartDTO> getShopCartItem(String ID) {
		String SQL = "SELECT * FROM shopping_cart WHERE ID = ? ORDER BY addDate DESC";

		ArrayList<ShopCartDTO> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShopCartDTO shopCartDto = new ShopCartDTO();
				shopCartDto.setItemCode(rs.getInt(1));
				shopCartDto.setID(rs.getString(2));
				shopCartDto.setAddDate(rs.getString(3).substring(0, 4) + "." + rs.getString(3).substring(5, 7)
						+ "." + rs.getString(3).substring(8, 10));
				shopCartDto.setFolderName(rs.getString(4));
				list.add(shopCartDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//날짜 별로 for문을 돌리기 위해 날짜만 이용해서 group형식으로 가져옴
	public ArrayList<String> getAddDate(String ID) {
		String SQL = "SELECT substr(addDate,1,10) FROM shopping_cart WHERE ID = ? GROUP BY substr(addDate,1,10) ORDER BY addDate DESC";
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
