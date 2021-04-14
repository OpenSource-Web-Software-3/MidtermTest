package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUser;

public class ItemDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ItemDAO() {

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

	public ItemDTO getItem(int itemCode) {
		String SQL = "SELECT * FROM item WHERE itemCode = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ItemDTO itemDto = new ItemDTO();
				itemDto.setItemCode(rs.getInt(1));
				itemDto.setItemName(rs.getString(2));
				itemDto.setItemPrice(rs.getInt(3));
				itemDto.setItemColor(rs.getString(4));
				itemDto.setItemSize(rs.getString(5));
				itemDto.setMain_cate(rs.getString(6));
				itemDto.setSub_cate(rs.getString(7));
				itemDto.setItemContent(rs.getString(8));

				return itemDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 메인 카테고리 선택 시
	public ArrayList<ItemDTO> getItemList(String main_cate) {

		String SQL = "";
		if (main_cate == null) {
			SQL = "SELECT * FROM item ORDER BY itemCode DESC";
		} else {
			SQL = "SELECT * FROM item WHERE main_cate = ? ORDER BY itemCode DESC";
		}

		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, main_cate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemDTO itemDto = new ItemDTO();
				itemDto.setItemCode(rs.getInt(1));
				itemDto.setItemName(rs.getString(2));
				itemDto.setItemPrice(rs.getInt(3));
				itemDto.setItemColor(rs.getString(4));
				itemDto.setItemSize(rs.getString(5));
				itemDto.setMain_cate(rs.getString(6));
				itemDto.setSub_cate(rs.getString(7));
				itemDto.setItemContent(rs.getString(8));
				list.add(itemDto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public ArrayList<ItemDTO> getItemList(int number) {

		String SQL = "SELECT * FROM item ORDER BY itemCode DESC LIMIT ?";

		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemDTO itemDto = new ItemDTO();
				itemDto.setItemCode(rs.getInt(1));
				itemDto.setItemName(rs.getString(2));
				itemDto.setItemPrice(rs.getInt(3));
				itemDto.setItemColor(rs.getString(4));
				itemDto.setItemSize(rs.getString(5));
				itemDto.setMain_cate(rs.getString(6));
				itemDto.setSub_cate(rs.getString(7));
				itemDto.setItemContent(rs.getString(8));
				list.add(itemDto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public int getNext() {
		String SQL = "SELECT itemCode FROM item ORDER BY itemCode DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류

	}

	// write
	public int insertItem(String itemName, String itemPrice, String itemColor, String itemSize, String main_cate,
			String sub_cate) {
		String SQL = "INSERT INTO item VALUES (?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, itemName);
			pstmt.setString(3, itemPrice);
			pstmt.setString(4, itemColor);
			pstmt.setString(5, itemSize);
			pstmt.setString(6, main_cate);
			pstmt.setString(7, sub_cate);
			pstmt.setString(8, "필요시 삭제");

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류

	}

	// Image file upload
	public int upload(String itemCode, String fileName, String fileRealName) {
		String SQL = "INSERT INTO file VALUES(?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, itemCode);
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

}
