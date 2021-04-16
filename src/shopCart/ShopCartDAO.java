package shopCart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import item.ItemDTO;
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

	public boolean checkItem_In_ShopCart(String ID, int itemCode) {
		String SQL = "SELECT * FROM shopping_cart WHERE ID = ? AND itemCode = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			pstmt.setInt(2, itemCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	public int addShopCart(int itemCode, String ID, String folderName) {
		String SQL = "INSERT INTO shopping_cart VALUES(?,?,NOW(),?)";

		try {
			if (checkItem_In_ShopCart(ID, itemCode)) { // 장바구니에 중복된 상품이 없으면
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, itemCode);
				pstmt.setString(2, ID);
				pstmt.setString(3, "folderName"); // 일단 예시(추후 수정 필요 할 수도 있음)
				return pstmt.executeUpdate();
			} else {
				return -1; // 이미 추가한 상품
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -2; // DB오류

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
				shopCartDto.setAddDate(rs.getString(3).substring(0, 4) + "." + rs.getString(3).substring(5, 7) + "."
						+ rs.getString(3).substring(8, 10));
				shopCartDto.setFolderName(rs.getString(4));
				list.add(shopCartDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// AJAX
	public ShopCartDTO getShopCartItem(int itemCode, String ID) {
		String SQL = "SELECT * FROM shopping_cart WHERE itemCode = ? AND ID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			pstmt.setString(2, ID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ShopCartDTO shopCartDto = new ShopCartDTO();
				shopCartDto.setItemCode(rs.getInt(1));
				shopCartDto.setID(rs.getString(2));
				shopCartDto.setAddDate(rs.getString(3).substring(0, 4) + "." + rs.getString(3).substring(5, 7) + "."
						+ rs.getString(3).substring(8, 10));
				shopCartDto.setFolderName(rs.getString(4));
				return shopCartDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	public ArrayList<ShopCartDTO> getShopCartItem(String ID, ArrayList<ItemDTO> itemCodes) {
//		ArrayList<String> list = new ArrayList<>();
//		String sql = "";
//		try {
//			PreparedStatement pstmt = null;
//			
//			if (itemCodes.size() == 0) { // sub_cate를 모두 체크 해제했을 때
//				// servlet에서 오버로딩으로 처리함
//			} else if (itemCodes.size() == 1) { // 단일 선택 시
//				sql = "SELECT substr(purchaseDate,1,10) FROM purchase_list WHERE ID = ? "
//						+ "AND itemCode IN() GROUP BY substr(purchaseDate,1,10) ORDER BY purchaseDate DESC";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, ID);
//				pstmt.setInt(2, itemCodes.get(0).getItemCode());
//			} else {
//
//				sql = "SELECT substr(purchaseDate,1,10) FROM purchase_list WHERE ID = ? AND itemCode IN(";
//				for (int i = 0; i < itemCodes.size() - 1; i++) {
//					sql += itemCodes.get(i).getItemCode() + ", ";
//				}
//				sql += itemCodes.get(itemCodes.size() - 1) + ") GROUP BY substr(purchaseDate,1,10) ORDER BY purchaseDate DESC";
//			}
//
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, ID);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				list.add(rs.getString(1).substring(0, 4) + "." + rs.getString(1).substring(5, 7) + "."
//						+ rs.getString(1).substring(8, 10));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//	

	// 날짜 별로 for문을 돌리기 위해 날짜만 이용해서 group형식으로 가져옴
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

	public int deletePurchaseItem_In_ShopCart(String ID, int itemCode) {
		String SQL = "DELETE FROM shopping_cart WHERE ID = ? AND itemCode = ?";
		try {
			if (!checkItem_In_ShopCart(ID, itemCode)) { // 장바구니에 추가한 상품이 있다면
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, ID);
				pstmt.setInt(2, itemCode);
				return pstmt.executeUpdate();
			} else {
				return 0; // 삭제안하고 넘어감
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB오류

	}

}
