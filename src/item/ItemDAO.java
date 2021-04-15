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
	
	// index.jsp에서 4개의 보기 목록 보여줄 때
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
	
	

	// category-skin.jsp 에서 메인 카테고리 선택 시
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
	
	// Ajax : aside.jsp sub_cate 선택시 -> aside-function.js -> getItemList_to_SubCateAction.java -> this
	public ArrayList<ItemDTO> getItemList(String []main_cate) {
		
		String SQL = "";
		if (main_cate.length == 0) {
			SQL = "SELECT * FROM item ORDER BY itemCode DESC";
		} else {
			SQL = "SELECT * FROM item WHERE main_cate = ? ORDER BY itemCode DESC";
		}
		
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, main_cate[0]); //어짜피 한개밖에 안들어옴 
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


	// Ajax : aside.jsp sub_cate 선택시 -> aside-function.js -> getItemList_to_SubCateAction.java -> this
	public ArrayList<ItemDTO> getItemList(String[] sub_cate, String[] main_cate) {
		String sql = "";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = null;

			if (sub_cate.length == 0) { // sub_cate를 모두 체크 해제했을 때
				//servlet에서 오버로딩으로 처리함
			} else if (sub_cate.length == 1) { //단일 선택 시
				sql = "SELECT * FROM item WHERE main_cate IN(?) AND sub_cate IN(?) ORDER BY itemCode DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, main_cate[0]);
				pstmt.setString(2, sub_cate[0]);
			} else { //다중 선택 시
				
				sql = "SELECT * FROM item WHERE main_cate IN(";
				for (int i = 0; i < main_cate.length - 1; i++) {
					sql += "\'" + main_cate[i] + "\'" + ", ";
				}
				sql += "\'" + main_cate[main_cate.length - 1] + "\'" + ") AND sub_cate In(";
						
				for (int i = 0; i < sub_cate.length - 1; i++) {
					sql += "\'" + sub_cate[i] + "\'" + ", ";
				}
				sql += "\'" + sub_cate[sub_cate.length - 1] + "\'" + ") ORDER BY itemCode DESC";

				// SELECT * FROM 테이블명 WHERE 컬럼명 IN(뭐뭐1, 뭐뭐2, 뭐뭐3, 뭐뭐4)ORDER BY 정렬기준 DESC
				pstmt = conn.prepareStatement(sql);
		
						
				
//				sql = "SELECT * FROM item WHERE main_cate = ? AND sub_cate IN(";
//				for (int i = 0; i < sub_cate.length - 1; i++) {
//					sql += "\'" + sub_cate[i] + "\'" + ", ";
//				}
//				sql += "\'" + sub_cate[sub_cate.length - 1] + "\'" + ") ORDER BY itemCode DESC";
//
//				// SELECT * FROM 테이블명 WHERE 컬럼명 IN(뭐뭐1, 뭐뭐2, 뭐뭐3, 뭐뭐4)ORDER BY 정렬기준 DESC
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, main_cate);

			}
			System.out.println(sql);
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
